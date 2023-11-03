<HTML>
<meta charset="UTF-8"> <!-- 设置网页字符编码为UTF-8，以支持中文 -->
<head>
    <title>按分类查询</title>
</head>
<BODY>
<hr />

<table border="1">
    <tr>
        <th>Disc_ID</th>
        <th>Content</th>
        <th>Class_Name</th>
        <th>Class_ID</th>
    </tr>

<?php
    // 连接到MySQL数据库
    $host = "sql311.byethost12.com";
    $username = "b12_6588581";
    $password = "827097";
    $database = "b12_6588581_disc_info";

    $conn = new mysqli($host, $username, $password, $database);
    // 设置连接字符编码为UTF-8
    $conn->set_charset("utf8");
    if ($conn->connect_error) {
        die("连接失败: " . $conn->connect_error);
    }
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // 检查是否设置了名为"options"的表单字段
    if (isset($_POST['Class_Name'])) {
        $selectedOption = $_POST['Class_Name'];
        echo "您选择的选项是：" . $selectedOption;
    } else {
        echo "未选择任何选项";
    }
}

     $sql = "SELECT DISTINCT mix.Disc_ID,mix.Content,classification.Class_Name,classification.Class_ID FROM mix INNER JOIN classification on mix.Class_ID=classification.Class_ID WHERE classification.Class_Name  like '%" . $selectedOption . "%' ORDER BY mix.Disc_ID";
     $result = $conn->query($sql);

if ($result->num_rows > 0)  {
	while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row["Disc_ID"] . "</td>";
            echo "<td>" . $row["Content"] . "</td>";
            echo "<td>" . $row["Class_Name"] . "</td>";
            echo "<td>" . $row["Class_ID"] . "</td>";

            echo "</tr>";
	  }
    } else {
       echo "对不起，没有找到匹配的数据。";
}

    $conn->close();
?>
</table>
</BODY>
</HTML>
