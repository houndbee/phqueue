<head>
<link href="phqueue.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

function createRequestObject() {
        var ro;
        var browser = navigator.appName;
        if(browser == "Microsoft Internet Explorer"){
                ro = new ActiveXObject("Microsoft.XMLHTTP");
        }
        else{
                ro = new XMLHttpRequest();
        }
        return ro;
}

function gottextchange(textboxname,showid,songid)
{
  var textbo = document.getElementsByName(textboxname);
  for(var i=0;i<textbo.length;i++){
    send_order(textbo[i].value,showid,songid);
    
  }
}

function send_order(order,showid,songid)
{
  var URL =  "save-order.php"+ "?order=" + order + "&showid=" + showid + "&songid=" +songid;
  ro = createRequestObject();
  ro.open('get',URL);
  ro.send(null);
}
</script>
</head>
<?
include ("config.php");
include ("header.php");
include ("helpers.php");
include ("mp3info.php");

// goto helps sometimes, having a global error check sucks
$error = 0;

if(isset($_POST['description'])) {
     $description = $_POST['description'];
     $logoimage = $_POST['showlogo'];
     $showname = $_POST['showname'];
     if (file_exists($show_path ."/". $_POST['dir'])) {
       insert_into_shows($showname, $description, $logoimage,$show_path . "/" . $_POST['dir']);
       $showid = get_show_id($showname);
       import_show($showid,$show_path ."/". $_POST['dir'],0);
     }
     else {
       $error =1; 
       print 'Directory does not exist, Please create it and refresh';
     }
}

if ($error ==0) {
  if(isset($_GET['showid'])) {
   $showid = $_GET['showid'];
   $showname = get_showname($showid);
   if (isset($_GET['refresh'])) {
	 delete_all_showtunes($showid);
       }
     $path = get_show_path($showid);
     import_show($showid,$path,0);
  }

  print ("<table align='center' border='1px dotted #909090'><tr><td><h2>Song Name</h2></td><td><h2>Artist</h2></td><td><h2>Album</h2></td><td><h2>time</h2></td><td>Operation</td><td>Order</td><td><h2>Filename</h2></td></tr>");

  $sql = "select * from tunes where showid='$showid'";
  if ( !($result = mysql_query($sql))) {
    print mysql_error();
  } else { 
    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
      print("<tr align='center'><td>\n");
      print($line['title'] . "</td><td>\n");
      $artist_name = get_artist_name($line['artistid']);
      print($artist_name . "</td><td>\n");
      print($line['album'] . "</td><td>\n");
      print($line['time'] . "</td><td>\n");
      print($line['fullpath'] . "</td><td>\n");
      $inname = $line['ID'];
      print("<input type='text' name='" . $inname . "' value='" . $line['pos'] . "' onchange=gottextchange('". $inname ."','" . $showid . "','" . $line['ID'] . "')></td>\n");
      print("<td><a href='edit-song.php?edit=1&showid=" . $showid . "&id=" . $line['ID'] . "'>Edit</a> /\n"); 
      print("<a href='edit-song.php?remove=1&showid=" . $showid . "&id=" . $line['ID'] . "'>Remove</a></td>\n"); 
      print("</tr>");
    }
  }
 }
?>

</table>
<?
print ("<div id='contenttool'><h2><a href='create-show.php?showid=" . $showid . "&refresh=1'>Refresh</a></h2></div>");
?>