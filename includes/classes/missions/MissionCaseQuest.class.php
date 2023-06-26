<?php

/**
 *  Space-Tactics
 *   by ShaoKhan 2021-2023
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package Space-Tactics
 * @author ShaoKhan <ShaoKhan@gmx.de>
 * @copyright 2023 ShaoKhan
 * @licence MIT
 * @version 0.1.0
 * @link https://github.com/ShaoKhan/Space-Tactics
 */


class MissionCaseQuest extends MissionFunctions implements Mission
{		
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{
		$sql = 'SELECT name FROM %%PLANETS%% WHERE `id` = :planetId;';

		$startPlanetName	= Database::get()->selectSingle($sql, array(
			':planetId'	=> $this->_fleet['fleet_start_id']
		), 'name');

		$targetPlanetName	= Database::get()->selectSingle($sql, array(
			':planetId'	=> $this->_fleet['fleet_end_id']
		), 'name');
		
		$LNG			= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);

		$Message		= sprintf($LNG['sys_tran_mess_owner'],
			$targetPlanetName, GetTargetAddressLink($this->_fleet, ''),
			pretty_number($this->_fleet['fleet_resource_metal']), $LNG['tech'][901],
			pretty_number($this->_fleet['fleet_resource_crystal']), $LNG['tech'][902],
			pretty_number($this->_fleet['fleet_resource_deuterium']), $LNG['tech'][903]
		);

		PlayerUtil::sendMessage($this->_fleet['fleet_owner'], 0, $LNG['sys_mess_tower'], 5,
			$LNG['sys_mess_transport'], $Message, $this->_fleet['fleet_start_time'], NULL, 1, $this->_fleet['fleet_universe']);

		if ($this->_fleet['fleet_target_owner'] != $this->_fleet['fleet_owner']) 
		{
			$LNG			= $this->getLanguage(NULL, $this->_fleet['fleet_target_owner']);
			$Message        = sprintf($LNG['sys_tran_mess_user'],
				$startPlanetName, GetStartAddressLink($this->_fleet, ''),
				$targetPlanetName, GetTargetAddressLink($this->_fleet, ''),
				pretty_number($this->_fleet['fleet_resource_metal']), $LNG['tech'][901],
				pretty_number($this->_fleet['fleet_resource_crystal']), $LNG['tech'][902],
				pretty_number($this->_fleet['fleet_resource_deuterium']), $LNG['tech'][903]
			);

			PlayerUtil::sendMessage($this->_fleet['fleet_target_owner'], 0, $LNG['sys_mess_tower'], 5,
				$LNG['sys_mess_transport'], $Message, $this->_fleet['fleet_start_time'], NULL, 1, $this->_fleet['fleet_universe']);
		}
	
		$this->StoreGoodsToPlanet();
		$this->setState(FLEET_RETURN);
		$this->SaveFleet();
	}
	
	function EndStayEvent()
	{
		return;
	}
	
	function ReturnEvent()
	{
		$LNG		= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);
		$sql		= 'SELECT name FROM %%PLANETS%% WHERE id = :planetId;';
		$planetName	= Database::get()->selectSingle($sql, array(
			':planetId'	=> $this->_fleet['fleet_start_id'],
		), 'name');

		$Message	= sprintf($LNG['sys_tran_mess_back'], $planetName, GetStartAddressLink($this->_fleet, ''));

		PlayerUtil::sendMessage($this->_fleet['fleet_owner'], 0, $LNG['sys_mess_tower'], 4, $LNG['sys_mess_fleetback'],
			$Message, $this->_fleet['fleet_end_time'], NULL, 1, $this->_fleet['fleet_universe']);

		$this->RestoreFleet();
	}

    function determineMissionSuccess(): bool
    {
        $successProbability = rand(0, 100);
        $successThreshold = QUEST_SUCCESS_TRESHOLD;
        return $successProbability >= $successThreshold;
    }
}