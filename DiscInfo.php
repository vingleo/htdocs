<HTML>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<BODY>
<?php
$db = mysql_connect("sql311.byethost12.com","b12_6588581","827097");
mysql_query("SET NAMES 'utf8'");
mysql_select_db("b12_6588581_disc_info");
$result=mysql_query("select * from mix",$db);
printf("Disc_ID: %s<br>",mysql_result($result,0,"Disc_ID"));
printf("Content: %s<br>",mysql_result($result,0,"Content"));
?>
</BODY>
</HTML>
