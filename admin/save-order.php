<?
include("helpers.php");
$songid = $_GET['songid'];
$showid = $_GET['showid'];
$order = $_GET['order'];

update_order($songid,$showid,$order);
?>
