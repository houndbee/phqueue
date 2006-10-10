<head>
<link href="phqueue.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
   current_submit=null;
function GetName(div_name, user_name)
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

 var content = "<div id='contentpopup'><p><form name='uploadshow' action='create-show.php' method='POST'><table><tr><td align='right'><div id='label'>Show Name:</td><td align='left' colspan='2' style='width:90%'><input type='text' name='showname'></div></td></tr><tr><td align='right'><div id='label'>Description:</td><td align='left'><textarea id='somemorerandomshit' name='description' rows='8' cols='60' wrap='virtual'></textarea></td></tr><tr><td align='right'><div id='label'>Show Logo:</td><td align='left' colspan='2'><input type='text' name='showlogo'></div></td></tr><tr><td align='right'><div id='Label'>Directory:</td><td><input type='text' name='dir'></td></div></tr><tr><td align='center' colspan='2'><i><b>Eg: gaurav-show, Directory is relative to the base /usr/local/tunes/shows/ create the directory /usr/local/tunes/shows/gaurav-show and upload songs before creating the show</i></b></td></tr></table><input type='submit' value='Submit'><input type='button' value='Cancel' onclick=javascript:removeEvent('" + div_name + "')></p></div>";
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
<body>
<div id="content">
<?
   print('<p class="label"><div id="showname"><a OnClick=GetName("showname","bleh")>Create a new show</a></div></p>');
?>
<input type="hidden" value="0" id="theValue" />
</div>
<div id ="content">
<h3>Edit/ Delete shows</h3>
<form name=song action=edit-shows.php method=POST>
<?
$sql = "select ID,showname from shows";
$result = mysql_query($sql);
if (!$result ) {
     print mysql_error();
 }
else { 
  print '<select name="shows">';
  while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $show_name = $line ['showname'];
    $show_id = $line ['ID'];
    print "<option value=\"$show_id\">$show_name\n";
  }
  print '</select>';
 }
?>
<BR><BR>
<input type="radio" name="function" value="1" checked> Edit
<input type="radio" name="function" value="2"> Remove
<p><input class="inputtext" type="submit" value="Submit"></p>
</div>
</body>
</html>