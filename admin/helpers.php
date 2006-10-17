<?
include("db.php");

function insert_into_shows($showname, $description, $logoimage,$showdir)
{
  if(check_show($showname)) {
    $sql = "insert into shows (showname,showdesc,logoimg,show_dir) values ('$showname','$description','$logoimage','$showdir')";
    
    if ( !mysql_query($sql) ) {
      print mysql_error();
    }
    else
      return 1;
  }
  
  return 0;
}

function check_show($showname)
{
 $sql = "select ID from shows where showname='$showname'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    if ($line['ID']) {
      printf("<h2>A show already exists at this time, Delete or Update it to continue</h2>");
      return 0;
    }
    return 1;
  }   
  return 1;
}


function get_show_id($showname)
{
  $sql = "select ID from shows where showname='$showname'";
  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    return $line['ID'];
  }   

}

function get_showname($showid)
{
  $sql = "select showname from shows where ID='$showid'";
  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    return $line['showname'];
  }   

}

function get_showid($showid)
{
 $sql = "select showname from shows where ID='$showid'";
  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    return $line['showname'];
  }   
}

function remove_from_master_table($post_showid,$post_showtime)
{
  $sql = "delete from masterschedule where showid='$post_showid' AND starttime='$post_showtime'";
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;

}

function remove_shows_from_master_table($post_showid)
{
  $sql = "delete from masterschedule where showid='$post_showid'";
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;

}

function update_master_table($post_showid,$post_showtime)
{
  $sql ="update masterschedule SET starttime='$post_showtime' where showid='$post_showid'";

  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;
}

function  update_tunes($title, $tuneid,$artistid,$fullpath,$album,$time,$order=-1)
{
$sql  = "update tunes set title='$title', artistid='$artistid', fullpath='$fullpath', album='$album', time='$time', pos='$order' where ID='$tuneid'";

  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;
}


function insert_into_master_table($post_showid,$post_showtime)
{

  if(check_entry($post_showid,$post_showtime)) {
    $sql = "insert into masterschedule (showid,starttime) values ('$post_showid','$post_showtime')";
       
       /*Check Later if the entry already exists*/
       
    if ( !mysql_query($sql) ) {
      print mysql_error();
    }
    else
      return 1;
  }
  else 
       return 0;
}

function check_entry($post_showid,$post_showtime)
{
  $sql = "select ID from masterschedule where starttime='$post_showtime'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else { 
    $line = mysql_fetch_assoc($result);
    if ($line['ID']) {
      printf("<h2>A show already exists at this time, Delete or Update it to continue</h2>");
      return 0;
    }
    return 1;
  }   
  return 1;
}

function insert_into_tunes($songname, $artistid, $fullpath, $album,$time,$showid,$order,$type=0)
{
  $sql = "insert into tunes (title,fullpath,album,artistid,time,pos,showid,type) values ('$songname','$fullpath','$album','$artistid','$time','$order' ,'$showid','$type')";
  
 if ( !mysql_query($sql) ) {
   print mysql_error();
 }
 else
   return 1;
}

function remove_songs_of_show($showid)
{
 $sql = "delete from tunes where showid='$showid'";
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;
}

function delete_shows($showid)
{
 
 $sql = "delete from shows where ID='$showid'";
 remove_shows_from_master_table($showid);
 remove_songs_of_show($showid);
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;
}

function delete_from_tunes($tuneid)
{
 $sql = "delete from tunes where ID='$tuneid'";
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;
}

function update_show($showid,$showname,$showdesc,$logoimg)
{
  $sql = "update shows set showname='$showname',showdesc='$showdesc',logoimg='$logoimg' where ID='$showid'";
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;  
}

function get_tune_id($songname,$showid)
{
  $sql = "select ID from tunes where title='$songname' and showid='$showid'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else {
        $line = mysql_fetch_assoc($result);	
	return $line['ID'];
  }
}

function get_show_path($showid)
{
  $sql = "select show_dir from shows where ID='$showid'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else {
        $line = mysql_fetch_assoc($result);	
	return $line['show_dir'];
  }

}

function delete_all_showtunes($showid)
{
$sql = "delete from tunes where showid='$showid'";
 if ( !mysql_query($sql) ) {
   print mysql_error();
 }
 else
   return 1;
}

function get_artist_name($artistid)
{
  $sql = "select name from artist where ID='$artistid'";

  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  }
  else {
        $line = mysql_fetch_assoc($result);	
	return $line['name'];
  }
}

function update_order($tuneid,$showid,$order)
{
$sql  = "update tunes set  pos='$order' where ID='$tuneid' and showid='$showid'";
 echo $sql;
  if ( !mysql_query($sql) ) {
    print mysql_error();
  }
  else
    return 1;

}

function artist_look_up ($artist_name)
{
  $sql = "select ID from artist where name='$artist_name'";
  $result = mysql_query ($sql);
  if (!$result)
    print mysql_error();
  $data = mysql_fetch_assoc ($result);
  if ( $data )
    return $data['ID'];
  else 
    return NULL;
}

function insert_band($artist_name)
{
  $sql = "insert into artist (name) values ('$artist_name')";
  if ( !mysql_query($sql))
        print mysql_error();
}

function check_or_insert_artist ($artist_name)
{
  if($artist_name) {
    if ( ($bandid = artist_look_up($artist_name))) {
      return $bandid;
    }  
    else {
      insert_band ($artist_name);
      return artist_look_up ($artist_name);
    }    
  }
}

?>
