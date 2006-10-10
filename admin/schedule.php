<html>
<script type="text/javascript">
   current_submit=null;
function GetShowName(div_name, user_name)
{
  if(current_submit)
    removeEvent(div_name);
  current_submit = div_name;
var ni = document.getElementById(div_name);
var numi = document.getElementById('theValue');
var num = (document.getElementById("theValue").value -1)+ 2;
numi.value = num;
var divIdName = "standardshit";
var newdiv = document.createElement('div');
newdiv.setAttribute("id",divIdName);
var content = "<div id='contentpopup'><p><form name=uploadshow action='schedule.php' method='POST'><div id='label'>Show Name:</div><input type='text' name='showname'><div id='label'>Date/Time</div><input type='text' name='date'><div id='label'>Eg: 19-6-2006 19:30</div><input type='submit' value='Submit'><input type='button' value='Cancel' onclick=javascript:removeEvent('" + div_name + "')></p></div>";
newdiv.innerHTML = content;
ni.appendChild(newdiv);
}

function removeEvent(div_name)
{
  var d = document.getElementById(div_name);
  var olddiv = document.getElementById("standardshit");
  d.removeChild(olddiv);
  current_submit=null;
}

</script>

<?
include ("config.php");
include ("header.php");
include ("helpers.php");
?>

<table align='center' border="1px dotted #909090"><tr><td><h2>Show Name</h2></td><td><h2>Start Time</h2></td></tr>
<?

if(isset($_POST['shows'])){
$post_showid = $_POST['shows'];
$post_showtime = $_POST['starttime'];
if($_POST['function']==1)
  insert_into_master_table($post_showid,$post_showtime);
else if ($_POST['function']==2)
  update_master_table($post_showid,$post_showtime);
else
  remove_from_master_table($post_showid,$post_showtime);

}

$sql = "select * from masterschedule order by starttime";
if ( !($result = mysql_query($sql))) {
     print mysql_error();
 }
else { 
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    print("<tr align='center'><td>");
    if ($line['showid'] == -1)
      $showname = "Random";
    else 
      $showname = get_showname($line['showid']);
    $showtime = $line['starttime'];
    print($showname);
    print("</td><td>");
    print($showtime);
    print("</td></tr>");
  }
 }
?>
</table>
<div id="contenttool">
<h3>Add/Edit Schedule</h3>
<form name=song action=schedule.php method=POST>
<?
$sql = "select showname,ID from shows";
$result = mysql_query($sql);

if (!$result ) {
  print mysql_error();
}
else {
  print '<select name="shows">';
  print '<option value="-1">Random';
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $show_name = $line ['showname'];
    $show_id = $line ['ID'];
    print "<option value=\"$show_id\">$show_name\n";
  }
  print '</select>';
 }

print '<select name="starttime">';
$i=0;
while ($i<24) {
   print "<option value=\"$i\">$i\n"; 
   $i++;
}

?>
</select>
<BR><BR>
<input type="radio" name="function" value="1" checked> Add
<input type="radio" name="function" value="2"> Update
<input type="radio" name="function" value="3"> Remove
<p><input class="inputtext" type="submit" value="Submit"></p>
</div>