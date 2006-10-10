<?php
/////////////////////////////////////////////////////////////////
/// getID3() by James Heinrich <info@getid3.org>               //
//  available at http://getid3.sourceforge.net                 //
//            or http://www.getid3.org                         //
/////////////////////////////////////////////////////////////////
//                                                             //
// /demo/demo.simple.write.php - part of getID3()              //
// Sample script showing basic syntax for writing tags         //
// See readme.txt for more details                             //
//                                                            ///
/////////////////////////////////////////////////////////////////
require_once('/var/www/getid3/getid3/getid3.php');

function tag_mp3($filename,$songname,$albumname,$artist,$time)
{
  $TaggingFormat = 'UTF-8';
  
  // Initialize getID3 engine
  $getID3 = new getID3;
  $getID3->setOption(array('encoding'=>$TaggingFormat));
  getid3_lib::IncludeDependency('/var/www/html/getid3/getid3/write.php', __FILE__, true);  

  // Initialize getID3 tag-writing module
  $tagwriter = new getid3_writetags;
  $tagwriter->filename       = $filename;
  $tagwriter->tagformats     = array('id3v1', 'id3v2.3');
  
  // set various options (optional)
  $tagwriter->overwrite_tags = true;
  $tagwriter->tag_encoding   = $TaggingFormat;
  $tagwriter->remove_other_tags = true;
  
  // populate data array
  $TagData['title'][]   = $songname;
  $TagData['artist'][]  = $artist;
  $TagData['album'][]   = $albumname;
 
  $tagwriter->tag_data = $TagData;

  // write tags
  if ($tagwriter->WriteTags()) {
    echo 'Successfully wrote tags<br>';
    if (!empty($tagwriter->warnings)) {
      echo 'There were some warnings:<br>'.implode('<br><br>', $tagwriter->warnings);
    }
  } else {
    echo 'Failed to write tags!<br>'.implode('<br><br>', $tagwriter->errors);
  }
}

?>