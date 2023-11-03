<?php
    // 连接数据库
    $mysqli = mysqli_connect("sql311.byethost12.com","b12_6588581","827097",'b12_6588581_ware');     //mysqli_close($con);
    $mysqli ? print 'yes!<br>':print "no!<br>";

    $sql = $mysqli -> query('use b12_6588581_ware');
    $sql = $mysqli -> query('set name utf8');

    // 创建数据表
    $sql = $mysqli -> query("create table hacker(
        id char(6) not null,
        name char(8) not null,
        chinese float not null,
        math float not null,
        english float not null
    )");
    if($sql == true){
        echo '成功创建hacker表！<br>';
    }else{
        echo '创建hacker表失败！'.$mysqli->error.'<br>';
    }

    // 添加数据——hacker
    // $sql  = "insert into hacker values('1','张三','10','20','30');"; 
    // $sql  .= "insert into hacker values('2','李四','66','77','88');"; 
    // $sql .= "insert into hacker values('3','王二','55','44','33');"; 
    // $sql .= "insert into hacker values('4','麻子','22','55','77')"; 
    // $rows = $mysqli->affected_rows;
    // if($rows == 3){
    //     echo "添加数据成功。<br>";
    // }else{
    //     echo '添加失败。'.$mysqli->error."<br>";
    // }

    $sql = $mysqli -> query("insert into hacker
        values('2','李四','66','77','88')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "添加数据成功。<br>";
    }else{
        echo '添加失败。'.$mysqli->error."<br>";
    }
    $sql = $mysqli -> query("insert into hacker
        values('3','王二','55','44','33')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "添加数据成功。<br>";
    }else{
        echo '添加失败。'.$mysqli->error."<br>";
    }
    $sql = $mysqli -> query("insert into hacker
        values('4','麻子','22','55','77')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "添加数据成功。<br>";
    }else{
        echo '添加失败。'.$mysqli->error."<br>";
    }

    // 数据查询
    $sql = $mysqli->query("select * from hacker");
    if($sql){
        // echo '有数据！<br>';
        $rows = $sql->num_rows;
        echo '查询结果共有'.$rows.'条记录<br>';
        echo "<table>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>语文</th>
                    <th>数学</th>
                    <th>英语</th>
                <tr>
        ";

        if($rows){
            while($row = $sql->fetch_assoc()){
                // echo 'id = '.$row['id'].'<br>name = '.$row['name'].'<br>chinese = '.$row['chinese'].'<br>math = '.$row['math'].'<br>english = '.$row['english'].'<br>';
                echo "<tr>
                            <td>".$row['id']."</td>
                            <td>".$row['name']."</td>
                            <td>".$row['chinese']."</td>
                            <td>".$row['math']."</td>
                            <td>".$row['english']."</td>
                    </tr>
                ";
            }
            echo "</table>";
        }else{
            echo '没有您要找的数据。<br>';
        }
    }else{
        echo 'MySQL语句有误。<br>'.$mysqli->error.'<br>';
    }

?>
