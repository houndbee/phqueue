<?
include ("config.php");
include ("header.php");
include ("helpers.php");

if(isset($_POST['function']) && ($_POST['function'] == 2)) {
  delete_shows($_POST['shows']);
  header("Location:show.php");
} else if(isset($_POST['function']) && ($_POST['function'] == 1)) {
  $showid=$_POST['shows'];
  $sql ="select * from shows where ID='$showid'";
  $result = mysql_query($sql);

  if (!$result )
     print mysql_error();  

  print("<form name=song action='edit-shows.php' method=POST>");

  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    
    print("<div id='label'>Show Name:</div><input type='text' name='showname' value='" . $line['showname'] . "'>");      
    print("<div id='label'>Show Description</div><textarea id='showdesc' name='description' rows='8' cols='60' wrap='virtual' >" . $line['showdesc'] . "</textarea>");
    print ("<input type='hidden' name='showid' value='" . $showid . "'>");
    print("<div id='label'>Logo:</div><input type='text' name='logo' value='" . $line['logoimg'] . "'>");      
  }
  print("<p><input class='inputtext' type='submit' value='Submit'></p>");
  print("<a href='create-show.php?showid=" . $showid . "'>Edit Songs</a>");

} else if (isset($_POST['description'])) {
    $showid=$_POST['showid'];
    update_show($_POST['showid'], $_POST['showname'],$_POST['description'],$_POST['logo']);
    header("Location:show.php");
}
?>