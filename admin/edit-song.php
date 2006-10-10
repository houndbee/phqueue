<?
include("header.php");
include("helpers.php");
require_once("/var/www/freetag/freetag.class.php");
require_once("mp3id3write.php");

if(isset($_GET['showid']))
   $showid=$_GET["showid"];
else if(isset($_POST['showid'])) {
  $showid = $_POST['showid'];
  $artistid = check_or_insert_artist($_POST['artistname']);
  if ($showid != -1)
    update_tunes($_POST['songname'],$_POST['tuneid'],$artistid,$_POST['filename'],$_POST['album'],$_POST['time'],$_POST['order']);
  else 
    update_tunes($_POST['songname'],$_POST['tuneid'],$artistid,$_POST['filename'],$_POST['album'],$_POST['time'],-1);

  tag_mp3($_POST['filename'],$_POST['songname'],$_POST['album'],$_POST['artistname'],$_POST['time']);

  if($showid==-1)    
    {      
      $freetag_options = array(
			       'db_user' => 'root',
			       'db_pass' => '',
			       'db_host' => 'localhost',
			       'db_name' => 'tunequeue'
			       );

      $freetag = new freetag($freetag_options);

      $freetag->delete_all_object_tags_for_user(1,$_POST['tuneid']);

      if (isset($_POST['tags']) && trim($_POST['tags']) != "") {       
	$freetag->tag_object(1, $tuneid, $_POST['tags']);
      }

      header("Location:randomizer.php");
    }
 else 
   header("Location:create-show.php?showid=" . $showid);
} 
if(isset($_GET["remove"])) {
  delete_from_tunes($_GET["id"]);
  $freetag_options = array(
			   'db_user' => 'root',
			   'db_pass' => '',
			   'db_host' => 'localhost',
			   'db_name' => 'tunequeue'
			   );
  
  $freetag = new freetag($freetag_options);
  
  $freetag->delete_all_object_tags_for_user(1,$_GET['id']);

   if($showid==-1)
     header("Location:randomizer.php");
   else 
     header("Location:create-show.php?showid=" . $showid);
}
?>
<p><form name=uploadshow action='edit-song.php' method='POST'>
<div id='contentpopup'>
<?
if(isset($_GET["edit"]))
{
  $tuneid = $_GET["id"];
  $sql = "select * from tunes where ID='$tuneid'";
  if ( !($result = mysql_query($sql))) {
     print mysql_error();
  }
  else { 
    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
      print("<div id='label'>Song Name:</div><input type='text' name='songname' value='" . $line['title'] . "'>");      

      print ("<input type='hidden' name='showid' value='" . $showid . "'>");
      print ("<input type='hidden' name='tuneid' value='" . $line['ID'] . "'>");
      $artist_name = get_artist_name($line['artistid']);
      print("<div id='label'>Artist Name:</div><input type='text' name='artistname' value='" . $artist_name . "'>");      
      print("<div id='label'>Path</div><input type='text' name='filename' value='" . $line['fullpath'] . "'>");
      print("<div id='label'>Album</div><input type='text' name='album' value='" . $line['album'] . "'>");
      print("<div id='label'>Time</div><input type='text' name='time' value='" . $line['time'] . "'>");
      if($showid==-1) {
	$freetag_options = array(
			   'db_user' => 'root',
			   'db_pass' => '',
			   'db_host' => 'localhost',
			   'db_name' => 'tunequeue'
			   );

	$freetag = new freetag($freetag_options);
	$tagArray = $freetag->get_tags_on_object($line['ID'], 0, 0,
						 1);

	$value="";
	if (count($tagArray) > 0) {      
	  foreach ( $tagArray as $tag ) {
	      $value = $value .  htmlspecialchars($tag['tag']);
	      $value = $value .  " ";
	  }
	}
		
	print("<div id='label'>Tags</div><input type='text' name='tags' value='" . $value  . "'>");
      }
      else
	print("<div id='label'>Order</div><input type='text' name='order' value='" . $line['pos'] . "'>");
    }
  }
}
?>
<BR>
<input type='submit' value='Submit'></p></div>
</div>

