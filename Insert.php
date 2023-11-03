<HTML>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<BODY>
<hr />
<?php
$db = mysql_connect("sql311.byethost12.com","b12_6588581","827097");
mysql_query("SET NAMES 'utf8'");
mysql_select_db("b12_6588581_disc_info");
$did=$_POST['disc_id'];
$dc=$_POST['content'];
$dcid=$_POST['class_id'];
$dr=$_POST['remark'];

//echo  $_POST["disc_id"];
if(empty($did)===false)
{
        $x=1;
}
else
{
        $x=0;
}
if(empty($dc)===false)
{
        $y=1;
}
else
{
        $y=0;
}
if(empty($dr)===false)
{
        $z=1;
}
else
{
        $z=0;
}

if ($x==0 && $y==0 && $z==0 )
{
        $jieguo = "1";
}
elseif ($x==1 && $y==0 && $z==0)
{
        $jieguo = "2";
}
elseif ($x==0 && $y==1 && $z==0)
{
        $jieguo = "3";
}
elseif ($x==0 && $y==0 && $z==1)
{
        $jieguo = "4";
}
elseif ($x==1 && $y==1 && $z==0)
{
        $jieguo = "5";
}
elseif ($x==0 && $y==1 && $z==1)
{
        $jieguo = "6";
}
elseif ($x==1 && $y==0 && $z==1)
{
        $jieguo = "7";
}
else
{
        $jieguo = "8";
}


switch ($jieguo)
{
case "1":
        echo "请输入《碟片编号》"."<br>";
        echo "请输入《碟片内容》"."<br>";
        echo "请输入《碟片备注》"."<br>";
        break;
case "2":
        echo "请输入《碟片内容》"."<br>";
        echo "请输入《碟片备注》"."<br>";
        break;
case "3":
        echo "请输入《碟片编号》"."<br>";
        echo "请输入《碟片备注》"."<br>";
        break;
case "4":
        echo "请输入《碟片编号》"."<br>";
        echo "请输入《碟片内容》"."<br>";
        break;
case "5":
        echo "请输入《碟片备注》"."<br>";
        break;
case "6":
        echo "请输入《碟片编号》"."<br>";
        break;
case "7":
        echo "请输入《碟片内容》"."<br>";
        break;
case "8":
{
$sql="INSERT INTO mix(Disc_ID,Content,Class_ID,Remark) VALUES('".$_POST[disc_id]."','".$_POST[content]."','".$_POST[class_id]."','".$_POST[remark]."')";
$result=mysql_query($sql,$db);
if(!$result)
  {
	die('对不起，插入失败!'. mysql_error());
  }
else
  {
echo "1条记录插入成功";
  }
mysql_close($db);
}
}
?>

</BODY>
</HTML>
