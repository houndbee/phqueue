<?

//Change this to suit actual paths
require_once('/var/www/getid3/getid3/getid3.php');                          

function import_show($showid,$dir,$type)
{
  // Initialize getID3 engine
  $getID3 = new getID3;

  // Read files and directories
  if (is_dir($dir)) {
    if ($dh = opendir($dir)) {
      while (($file = readdir($dh)) !== false) {
	$full_name = $dir ."/" . $file;
	if (is_file($full_name) || ($file[0] != '.')) {
	  $ThisFileInfo = $getID3->analyze($full_name);
	  
	  if ($ThisFileInfo['fileformat']=="mp3") {
	    getid3_lib::CopyTagsToComments($ThisFileInfo);
	  
	    $album = mysql_real_escape_string(@implode(@$ThisFileInfo['comments_html']['album']));
	    $play_time = mysql_real_escape_string(@$ThisFileInfo['playtime_seconds']);
	    $title_name =  mysql_real_escape_string(@implode(@$ThisFileInfo['comments_html']['title']));
	    $artist_name = mysql_real_escape_string(@implode(@$ThisFileInfo['comments_html']['artist']));
	    
	    $full_name = mysql_real_escape_string($full_name);
	    if(($id = song_non_existant($full_name))) {
	      $artist_id = check_or_insert_artist ($artist_name);
	      insert_into_tunes($title_name, $artist_id, $full_name, $album,$play_time,$showid,-1,$type);
	    } else {
	      $artist_id = check_or_insert_artist ($artist_name);
	      update_tunes($title_name, $id,$artist_id,$full_name,$album,$play_time);	    
	    }
	  }
	}
      }
       closedir($dh);
    }
  } 
}

function song_non_existant($fullpath)
{
  $sql = "select ID from tunes where fullpath='$fullpath'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    if ($line['ID']) {     
      return 0;
    }
    return 1;
  }
}

?>