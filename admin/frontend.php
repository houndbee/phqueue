<?
include ('header.php');
include ('helpers.php');
  
$sql = "select * from producer where curstatus=-1 order by ID desc";
$result = mysql_query($sql);
if (!$result ) {
     print mysql_error();
 } else {
  $i=0;
?>
<h1>Last 5 songs</h1>
<table>
<tr><td><h2>Name</h2></td><td><h2>Filename</h2></td><td><h2>Artist</h2></td></tr>
<?
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $tuneid= $line['tuneid'];
    $sql1 = "select * from tunes where ID='$tuneid'";
    $result1 = mysql_query($sql1);
    while ($line1 = mysql_fetch_array($result1, MYSQL_ASSOC)) {
      print "<tr><td>" . $line1['title'] . "</td>";
      print "<td>" . $line1['filename'] . "</td>";
      print "<td>" . $line1['artist'] . "</td></tr>";
    }
    $i++;
    if ($i==5)
      break;
  }
 }
?>
</table>
<?
$sql = "select * from producer where curstatus=0";
$result = mysql_query($sql);
if (!$result ) {
     print mysql_error();
 } else {
  $i=0;
?>

<h1>Now Playing</h1>
<table>
<tr><td><h2>Name</h2></td><td><h2>Filename</h2></td><td><h2>Artist</h2></td></tr>
<?
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $tuneid= $line['tuneid'];
    $sql1 = "select * from tunes where ID='$tuneid'";
    $result1 = mysql_query($sql1);
    while ($line1 = mysql_fetch_array($result1, MYSQL_ASSOC)) {
      print "<tr><td>" . $line1['title'] . "</td>";
      print "<td>" . $line1['filename'] . "</td>";
      print "<td>" . $line1['artist'] . "</td></tr>";
    }
    $i++;
    if ($i==5)
      break;
  }
 }
?>
</table>

<?
$sql = "select * from producer where curstatus=1";
$result = mysql_query($sql);
if (!$result ) {
     print mysql_error();
 } else {
  $i=0;
?>

<h1>Coming up</h1>
<table>
<tr><td><h2>Name</h2></td><td><h2>Filename</h2></td><td><h2>Artist</h2></td></tr>
<?
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $tuneid= $line['tuneid'];
    $sql1 = "select * from tunes where ID='$tuneid'";
    $result1 = mysql_query($sql1);
    while ($line1 = mysql_fetch_array($result1, MYSQL_ASSOC)) {
      print "<tr><td>" . $line1['title'] . "</td>";
      print "<td>" . $line1['filename'] . "</td>";
      print "<td>" . $line1['artist'] . "</td></tr>";
    }
  }
 }
?>
</table>