<?php

/**
 * Space-Tactics - Quests
 * 2023 ShaoKhan
 */

class ShowQuestsPage extends AbstractGamePage
{

    function __construct()
    {
        parent::__construct();
    }

    public function show()
    {
        global $USER, $PLANET, $LNG, $resource;
        $db             = Database::get();
        $i              = 0;
        $fleetFunctions = new FleetFunctions();
        $quests         = Database::get()->select("SELECT q.* FROM %%QUESTS%% q WHERE q.active = 1");
        $UserDeuterium  = $PLANET['deuterium'];

        foreach($quests as $quest) {

            $quests[$i]['questtype']  = $LNG['quests_' . $quest['type']];
            $quests[$i]['rewardtype'] = $LNG['quests_' . $quest['reward_type']];
            $rewards[$i]              = json_decode($quest['reward_details'], 1);
            $fleetNeeded[$i]          = json_decode($quest['fleet_needed'], 1);
            $destination[$i]          = explode(';', $quest['destination']);

            foreach($rewards[$i] as $key => $reward) {
                $rewards[$i][$key] = $reward . ' ' . $LNG['quests_' . $key];
            }

            foreach($fleetNeeded[$i] as $fleetKey => $fleet) {
                $fleets[$i][$fleetKey] = $fleet . ' ' . $LNG['tech'][$fleetKey];
            }

            $quests[$i]['destination']   = $destination[$i][0] . ':' . $destination[$i][1] . ':' . $destination[$i][2];
            $quests[$i]['rewarddetails'] = $rewards[$i];
            $quests[$i]['fleetNeeded']   = $fleets[$i];
            $i++;
        }

        if(isset($_POST["qid"])) {
            $qid = $_POST["qid"];
            //prüfen, ob ausgewählte Quest bereits aktiv ist um doppeltes aktivieren / Page reload zu verhindern
            $checkIsQuestActive = $db->select("SELECT qu.* FROM %%QUESTS_USER%% qu WHERE qu.questId = '$qid'");
            if(!$checkIsQuestActive) {
                //get selected Quest
                [$selectedQuest] = $db->select("SELECT q.* FROM %%QUESTS%% q WHERE q.uuid = '" . $qid . "'");
                $neededFleets = json_decode($selectedQuest['fleet_needed'], TRUE);
                $destination  = explode(';', $selectedQuest['destination']);
                $fleetReady   = $fleetFunctions->getFleetOnPlanet($PLANET["id"], $neededFleets);

                //Es wird Flotte benötigt
                if($selectedQuest['fleet_needed'] != "") {
                    $TransportMetal     = max(0, round(HTTP::_GP('metal', 0.0)));
                    $TransportCrystal   = max(0, round(HTTP::_GP('crystal', 0.0)));
                    $TransportDeuterium = max(0, round(HTTP::_GP('deuterium', 0.0)));

                    //get FleetSlots
                    $fleetSlots = $fleetFunctions->GetMaxFleetSlots($USER);
                    //how many fleets are currently flying ?
                    $flyingFleets = count(
                        $db->select('SELECT * FROM %%FLEETS%% WHERE fleet_owner = :userID AND fleet_mission <> 10 ORDER BY fleet_end_time ASC;', [
                            ':userID' => $USER['id'],
                        ]),
                    );

                    if($flyingFleets < $fleetSlots) {
                        $SpeedFactor   = $fleetFunctions->GetGameSpeedFactor();
                        $Distance      = $fleetFunctions->GetTargetDistance([$PLANET['galaxy'], $PLANET['system'], $PLANET['planet']], [$destination['0'], $destination['1'], $destination['2']]);
                        $SpeedAllMin   = $fleetFunctions->GetFleetMaxSpeed($neededFleets, $USER);
                        $Duration      = $fleetFunctions->GetMissionDuration(10, $SpeedAllMin, $Distance, $SpeedFactor, $USER);
                        $consumption   = $fleetFunctions->GetFleetConsumption($neededFleets, $Duration, $Distance, $USER, $SpeedFactor);
                        $UserDeuterium -= $consumption;

                        $fleetResource  = [
                            901 => min($TransportMetal, floor($PLANET[$resource[901]])),
                            902 => min($TransportCrystal, floor($PLANET[$resource[902]])),
                            903 => min($TransportDeuterium, floor($PLANET[$resource[903]] - $consumption)),
                        ];
                        $fleetStartTime = $Duration + TIMESTAMP;
                        $fleetStayTime  = $fleetStartTime;
                        $fleetEndTime   = $fleetStayTime + $Duration;

                        if($UserDeuterium <= 0) {
                            echo "Zu wenig Deuterium";
                        }
                        if($consumption > $fleetFunctions->GetFleetRoom($neededFleets)) {
                            echo "Deine Flotte kann nicht ausreichend Deuterium als Treibstoff mitnehmen.";
                        }

                        $missionType = 20;

                        if($fleetReady["success"] === 1) {
                            $fleetFunctions->sendFleet(
                                $neededFleets,
                                $missionType,
                                $USER["id"],
                                $PLANET["id"],
                                $PLANET["galaxy"],
                                $PLANET["system"],
                                $PLANET["planet"],
                                $PLANET["planet_type"],
                                0,
                                0,
                                $destination[0],
                                $destination[1],
                                $destination[2],
                                0,
                                $fleetResource,
                                $fleetStartTime,
                                $fleetStayTime,
                                $fleetEndTime,
                                0,
                            );
                        }

                    }
                } else {
                    echo "Du hast nicht genug Slots um noch eine Flotte zu verschicken. Vielleicht hilft dir weitere <a href='game.php?page=research'>Forschung.</a>";
                }

                $db->insert("INSERT INTO %%QUESTS_USER%% (questId, userId, started_on) VALUES ('" . $qid . "', " . $USER['id'] . ", '" . date('Y-m-d H:i:s') . "')");
                $db->update("UPDATE %%QUESTS%% SET active = 0 WHERE uuid = '$qid'");
                HTTP::redirectTo('game.php?page=quests');
            }
        }

        if($quests !== NULL) {
            $this->assign(["quests" => $quests]);
        }
        $this->display('page.quests.default.tpl');
    }
}