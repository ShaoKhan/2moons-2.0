<?php

#require('includes/classes/PlayerUtil.class.php');

#$player = new PlayerUtil();

$servername = "localhost";
$username   = "t4ct1c3r";
$password   = "Hqv50c9_";
$database   = "sp4cet";
#$dsn = "mysql:host=localhost;dbname=".$database.";charset=UTF8";

try {
    $dbh = new PDO('mysql:host=localhost;dbname=sp4cet', $username, $password);
}
catch(PDOException $e) {
    die();
}

$userid = base64_decode($_GET["st"]);

$sql = 'SELECT * FROM uni1_votes WHERE uid = :uid';
$sth = $dbh->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);

$sth->execute(['uid' => $userid]);
$res = $sth->fetchObject();

$sql = 'SELECT username FROM uni1_users WHERE id = :id';
$sth = $dbh->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
$sth->execute(['id' => base64_decode($_GET["st"])]);
$usr = $sth->fetchObject();

if(!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip = $_SERVER['HTTP_CLIENT_IP'];
} elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
} else {
    $ip = $_SERVER['REMOTE_ADDR'];
}

$userid = (int)$_GET['st'] ?? NULL;

if(empty($res)) {
    $callback_url = urlencode(base64_encode('https://Space-Tactics.com/voteST.php?user=' . $usr->username . '&uid=' . $userid));
    $curl_session = curl_init();
    curl_setopt($curl_session, CURLOPT_URL, 'https://www.arena-top100.com/index.php?a=in&u=ShaoKhan&callback=' . $callback_url);
    $result = curl_exec($curl_session);
    curl_close($curl_session);
    $sql = 'INSERT INTO uni1_votes (uid, votedate, voteresult, points) VALUES (:id, ' . date("Y-m-d H-i-s") . ', 1, 100)';
    //ToDo Update DM at user

    $_SESSION["success"] = "Vielen Dank für dein Voting.";
} else {
    $sql               = 'INSERT INTO uni1_votes (uid, votedate, voteresult, points) VALUES (:id, ' . date("Y-m-d H-i-s") . ', 0, 0)';
    $_SESSION["error"] = "Du hast bereits gevoted. Vielen Dank.";

}

$sth = $dbh->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
$sth->execute(['id' => $userid]);

//https://space-tactics.com/index.php?a=in&u=ShaoKhan&callback=aHR0cHM6Ly9TcGFjZS1UYWN0aWNzLmNvbS92b3RlU1QucGhwP3VzZXI9U2hhb0toYW4mdWlkPTA%3D&__cf_chl_rt_tk=t3_QVI3RtssyJAxy5BAfS8GO2qcWBl77PpU9dkHA50g-1673297623-0-gaNycGzNBtE
