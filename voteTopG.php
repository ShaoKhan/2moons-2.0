<?php
const DEBUG    = 1;
const LOG_FILE = "_postback.log";
define("TOPG_IP", gethostbyname("monitor.topg.org"));

$ip_request = $_SERVER['REMOTE_ADDR'];
if($ip_request == TOPG_IP) {
    if(DEBUG) {
        error_log(date('[Y-m-d H:i] ') . "[OK] Valid callback: $ip_request" . PHP_EOL, 3, LOG_FILE);
    }
    $p          = preg_replace('/[^A-Za-z0-9\_\-]+/', '', $_GET['p_resp']); //can be only numbers letters, minus and underscore
    $user_ip    = preg_replace('/[^0-9\.]+/', '', $_GET['ip']);             //can be only numbers and dots
    if(DEBUG) {
        error_log(date('[Y-m-d H:i] ') . "[GET] Parameters [p_resp]=$p [ip]=$user_ip" . PHP_EOL, 3, LOG_FILE);
    }

    //Note: we send the parameters $_GET['p_resp'] and $_GET['ip'] back ONLY! if user $p has voted
    //here run your code
    //first you should check if account $p is valid and exists in your database
    //also check if the user has voted in the last 12 hours
    //give points to user $p that voted with ip $user_ip
    //close database
    $servername = "localhost";
    $username   = "t4ct1c3r";
    $password   = "Hqv50c9_";
    $database   = "sp4cet";

    try {
        $dbh = new PDO('mysql:host=localhost;dbname=sp4cet', $username, $password);
    }
    catch(PDOException $e) {
        die();
    }

    $sql = 'INSERT INTO uni1_votes (uid, votedate, voteresult, points) VALUES (:id, ' . date("Y-m-d H-i-s") . ', 1, 100)';
    $sth = $dbh->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $sth->execute(['id' => $p]);


} else {
    if(DEBUG == TRUE) {
        error_log(date('[Y-m-d H:i] ') . "[Invalid] Invalid request: $ip_request" . PHP_EOL, 3, LOG_FILE);
    }
    //handle invalid request when callback is NOT from TopG.
    //ignore or log the $ip_request as invalid request in your database
}