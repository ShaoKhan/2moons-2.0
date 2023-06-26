<?php

namespace Models;

use Database;

class Fleet
{

    public ?Database $db;

    public int   $fleet_id;
    public int   $fleet_owner;
    public int   $fleet_mission;
    public int   $fleet_amount;
    public array $fleet_array;
    public int   $fleet_universe;
    public int   $fleet_start_time;
    public int   $fleet_start_id;
    public int   $fleet_start_galaxy;
    public int   $fleet_start_system;
    public int   $fleet_start_planet;
    public int   $fleet_start_type;
    public int   $fleet_end_time;
    public int   $fleet_end_stay;
    public int   $fleet_end_id;
    public int   $fleet_end_galaxy;
    public int   $fleet_end_system;
    public int   $fleet_end_planet;
    public int   $fleet_end_type;
    public int   $fleet_target_obj;
    public int   $fleet_resource_metal;
    public int   $fleet_resource_crystal;
    public int   $fleet_resource_deuterium;
    public int   $fleet_resource_darkmatter;
    public int   $fleet_target_owner;
    public int   $fleet_group;
    public int   $fleet_mess;
    public int   $start_time;

    public function __construct()
    {
        $this->db = Database::get();
    }

    /**
     * @param int $planetId
     * @param     $excludeID
     *
     * @return array
     * @throws \Exception
     *
     */
    public function getFleetOnPlanet(int $planetId, $excludeID = []): array
    {
        $addExclude = "";
        if(!empty($excludeID)) {
            $addExclude = 'AND elementID NOT IN (' . implode(',', $excludeID) . ')';
        }
        $fleetTypes = $this->db->select('SELECT `name` FROM %%VARS%% WHERE class = 200 ' . $addExclude);
        $fleetTypes = array_column($fleetTypes, 'name');

        $fleetPlanet = $this->db->select('SELECT ' . implode(',', $fleetTypes) . ' FROM %%PLANETS%% WHERE id = ' . $planetId);
        return $fleetPlanet[0];
    }


}