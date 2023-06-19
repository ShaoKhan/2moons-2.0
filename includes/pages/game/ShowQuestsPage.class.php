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

        global $USER, $PLANET, $resource, $LNG, $reslist;
        $db     = Database::get();
        $config = Config::get();

        //create quest table
        //create quest->user table
        //cronjob for daily new quests ?
        //possible quest types (more can follow): 1. build 2. research 3. fleet 4. defense 5. attack 6. trade 7. mine 8. collect 9. destroy 10. spy 11. transport 12. colonize 13. moon


        #$config = Config::get();
        #$config->max_galaxy;
        #$config->max_system;
        #$config->max_planets;

        $quests = Database::get()->select("SELECT q.* FROM %%QUESTS%% q WHERE q.active = 1");
        $i = 0;
        foreach($quests as $quest) {

            $quests[$i]['type'] =  $LNG['quests_'.$quest['type']];
            $quests[$i]['reward_details'] = json_decode($quest['reward_details'], true);
            $i++;
        }

        
        $this->assign(["quests" => $quests]);
        $this->display('page.quests.default.tpl');
    }


}