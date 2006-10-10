<head>
<link href="phqueue.css" rel="stylesheet" type="text/css">
</head>
<?
include ("config.php");
include ("header.php");
include ("helpers.php");
include ("mp3info.php");
require_once("/var/www/freetag/freetag.class.php");

if (isset($_GET['refresh'])) {
  delete_all_showtunes(-1);
}

import_show(-1,$randomizer_path,0);
?>
<table align='center' border="1px dotted #909090"><tr><td><h2>Song Name</h2></td><td><h2>Filename</h2></td><td><h2>Artist</h2></td><td><h2>Album</h2></td><td><h2>time</h2></td><td><h2>Operation</h2></td><td><h2>tags</h2></td></tr>
<?
$sql = "select * from tunes where showid='-1' and type='0'";
if ( !($result = mysql_query($sql))) {
     print mysql_error();
}
else { 
  $freetag_options = array(
			   'db_user' => 'root',
			   'db_pass' => '',
			   'db_host' => 'localhost',
			   'db_name' => 'tunequeue'
			   );

  $freetag = new freetag($freetag_options);
  $userid=1;
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    print("<tr align='center'><td>\n");
    print($line['title'] . "</td><td>\n");
    print($line['fullpath'] . "</td><td>\n");
    $artist_name = get_artist_name($line['artistid']);
    print($artist_name . "</td><td>\n");
    print($line['album'] . "</td><td>\n");
    print($line['time'] . "</td>\n");
    
    /*Only tag by the super musician/user*/
    print("<td><a href='edit-song.php?edit=1&showid=-1&id=" . $line['ID'] . "'>Edit</a> /\n"); 
    print("<a href='edit-song.php?remove=1&showid=-1&id=" . $line['ID'] . "'>Remove</a></td>\n"); 
    print("<td>\n");
    $tagArray = $freetag->get_tags_on_object($line['ID'], 0, 0,
						 $userid);
    if (count($tagArray) > 0) {      
        foreach ( $tagArray as $tag ) {
               if ( $tag['tagger_id'] == $userid ) {
                   print htmlspecialchars($tag['raw_tag']);
             } else {
                   print htmlspecialchars($tag['tag']);
             }
               print " ";
        }
    }
    print("</td>\n");

    print("</tr>");
  }
 }
?>
</table>
<?
print ("<div id='contenttool'><h2><a href='randomizer.php?&refresh=1'>Refresh</a></h2></div>");
?>