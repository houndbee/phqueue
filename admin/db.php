<?
$dbhost="localhost";
$dbuser="username";
$dbname="dbname";
$dbpass="dbpass";

$connect=mysql_connect($dbhost, $dbuser,$dbpass);
mysql_select_db($dbname);
?>
