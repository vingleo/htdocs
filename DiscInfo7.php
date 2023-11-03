<HTML>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<BODY>
<hr />
<?php
$db = mysql_connect("sql311.byethost.com","b12_6588581","827097"); 
mysql_query("SET NAMES 'utf8'");
mysql_select_db("b12_6588581_disc_info");
$dn=$_POST["Content"];

if (empty($dn))
      {
	echo "请输入关键字！";
      }	
else
{	
	$dl=$_POST["Limit"];
	$dname=$_POST["AllResult"];
if ($dname=="result_select")
    {
$result=mysql_query("SELECT DISTINCT mix.Disc_ID,mix.Content,classification.Class_Name,mix.Remark FROM mix INNER JOIN classification on mix.Class_ID=classification.Class_ID WHERE mix.Content like'%" . $dn . "%' ORDER BY mix.Disc_ID LIMIT $dl",$db);
  if ($myrow = mysql_fetch_array($result))
        {
	echo "<table border=1>\n";
	echo "<tr><td>Disc_ID</td><td>Content</td><td>Class_Name</td><td>Remark</td></tr>\n";
       do 
	    {
	      printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n",$myrow[Disc_ID],$myrow[Content],$myrow[Class_Name],$myrow[Remark]);
	    }
	while ($myrow = mysql_fetch_array($result));
	
        echo "</table>\n";
         }
  else
            {
	echo "对不起，没有找到数据！";
             }
}
else
{
$result=mysql_query("SELECT DISTINCT mix.Disc_ID,mix.Content,classification.Class_Name FROM mix INNER JOIN classification on mix.Class_ID=classification.Class_ID WHERE mix.Content like'%" . $dn . "%' ORDER BY mix.Disc_ID",$db);
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
else
       {
	echo "对不起，没有找到数据！";
       } 
 }

}

?>
</BODY>
</HTML>
