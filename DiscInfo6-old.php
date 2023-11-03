<HTML>
<meta http-equiv="content-type" content="text/html;charset=GBK" />
<BODY>
<hr />
<?php
$db = mysql_connect("sql311.byethost12.com","b12_6588581","827097"); 
mysql_query("SET NAMES 'GBK'");
mysql_select_db("b12_6588581_disc_info");
$dn=$_POST["Class_Name"];
//$dc=$_POST["Content"];
$result=mysql_query("SELECT DISTINCT mix.Disc_ID,mix.Content,classification.Class_Name FROM mix INNER JOIN classification on mix.Class_ID=classification.Class_ID WHERE classification.Class_Name like'%" . $dn . "%' ORDER BY mix.Disc_ID",$db);
//$result1=mysql_query("SELECT mix.Disc_ID,mix.Content,classification.class_name FROM mix INNER JOIN classification on mix.Class_ID=classification.class_ID where mix.Content like'%" . $dc . "%'",$db);
//$result=mysql_query("select * from mix where Disc_ID = 'YL0100'",$db);
if ($myrow = mysql_fetch_array($result))
  {
	echo "<table border=1>\n";
	echo "<tr><td>Disc_ID</td><td>Content</td><td>Class_Name</td></tr>\n";
       do 
	{
	      printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n",$myrow[Disc_ID],$myrow[Content],$myrow[Class_Name]);
	}
	while ($myrow = mysql_fetch_array($result));
	
        echo "</table>\n";
  }
/*
elseif ($myrow = mysql_fetch_array($result1))
  {
	echo "<table border=1>\n";
	echo "<tr><td>Disc_ID</td><td>Content</td><td>Class_Name</td></tr>\n";
        do
	{
	      printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n",$myrow[Disc_ID],$myrow[Content],$myrow[Class_Name]);
	}
        while ($myrow = mysql_fetch_array($result1));
	echo "</table>\n";
  }
*/
else
{
	echo "对不起，没有找到数据！";
}


?>
</BODY>
</HTML>
