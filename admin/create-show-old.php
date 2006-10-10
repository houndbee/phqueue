<head>
<link href="phqueue.css" rel="stylesheet" type="text/css">
</head>
<?

include ("config.php");
include ("header.php");
include ("helpers.php");

if(isset($_POST['showname'])) {
  $showname = $_POST['showname'];
  $showid = get_show_id($showname);
 }  else if (isset($_GET['showid'])) {
  $showid = $_GET['showid'];
  $showname = get_showname($showid);
 } else {
  printf("Something bad happened, go wash your hands");
 }
   
if(isset($_POST['description'])) {
     $description = $_POST['description'];
     $logoimage = $_POST['showlogo'];
     if (directory_exists($show_path . $_POST['dir']))
       insert_into_shows($showname, $description, $logoimage);
     else 
       print 'Directory does not exist, Please create it and refresh'
}



if(isset($_POST['songname'])) {
  /*todo check if the order number already exists*/
  insert_into_tunes($_POST['songname'], $_POST['artist'], $_POST['filename'], $_POST['album'],$_POST['time'],$showid,$_POST['order']);
}
 
?>

<table align='center' border="1px dotted #909090"><tr><td><h2>Song Name</h2></td><td><h2>Filename</h2></td><td><h2>Artist</h2></td><td><h2>Album</h2></td><td><h2>time</h2></td><td>Operation</td></tr>
<?
$sql = "select * from tunes where showid='$showid'";
if ( !($result = mysql_query($sql))) {
     print mysql_error();
 }
else { 
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    print("<tr align='center'><td>\n");
    print($line['title'] . "</td><td>\n");
    print($line['filename'] . "</td><td>\n");
    print($line['artist'] . "</td><td>\n");
    print($line['album'] . "</td><td>\n");
    print($line['time'] . "</td>\n");
    print("<td><a href='edit-song.php?edit=1&showid=" . $showid . "&id=" . $line['ID'] . "'>Edit</a> /\n"); 
    print("<a href='edit-song.php?remove=1&showid=" . $showid . "&id=" . $line['ID'] . "'>Remove</a></td>\n"); 
    print("</tr>");
  }
 }
?>
</table>
<div id="contenttool">
<h3>Add/Edit Songs</h3>
<div id='contentpopup'>
<p><form name=uploadshow action='create-show.php' method='POST'>
<div id='label'>Filename</div><input type='text' name='filename'>
<div id='label'>Song Name:</div><input type='text' name='songname'>
<div id='label'>Arist</div><input type='text' name='artist'>
<?
print ("<input type='hidden' name='showname' value='" . $showname . "'>");
?>
<div id='label'>Album</div><input type='text' name='album'>
<div id='label'>Time</div><input type='text' name='time'>
<div id='label'>Order</div><input type='text' name='order'><BR>
<input type='submit' value='Submit'></p></div>
</div>