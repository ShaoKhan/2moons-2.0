<?php

/**
 *  2Moons
 *   by Jan-Otto Kröpke 2009-2016
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package 2Moons
 * @author Jan-Otto Kröpke <slaver7@gmail.com>
 * @copyright 2009 Lucky
 * @copyright 2016 Jan-Otto Kröpke <slaver7@gmail.com>
 * @licence MIT
 * @version 1.8.0
 * @link https://github.com/jkroepke/2Moons
 */

require_once('includes/classes/class.GalaxyRows.php');

class ShowPlayerstatisticsPage extends AbstractGamePage
{
    public static $requireModule = MODULE_RESEARCH;
    
    function __construct()
    {
        parent::__construct();
    }
    
    
    public function show()
    {
        global $USER, $PLANET, $resource, $LNG, $reslist;
        $db      = Database::get();
        $session = unserialize($_SESSION['obj']);
        
        $now    = date('Y-m-d');
        $before = date('Y-m-d', strtotime('-30 day'));
        
        $sql = 'SELECT * FROM %%STATISTICS%% WHERE uid = '.$session->userId.' AND from_date BETWEEN "'.$before.'" AND "'.$now.'"   ORDER BY uid ASC;';
        $res = $db->select($sql, []);
        
        foreach($res as $key => $value){
            $res['buildings'][] = $value['build'];
            $res['science'][]   = $value['tech'];
            $res['fleet'][]     = $value['fleet'];
            $res['defense'][]   = $value['def'];
            $res['summary'][]   = $value['total'];
            $res["times"][]     = $value['from_date'];
            
        }

        $this->assign(["playerdata" => $res]);
        $this->display('page.playerstatistics.default.tpl');
    }
    
}