<?php
    // �������ݿ�
    $mysqli = mysqli_connect("sql311.byethost12.com","b12_6588581","827097",'b12_6588581_ware');     //mysqli_close($con);
    $mysqli ? print 'yes!<br>':print "no!<br>";

    $sql = $mysqli -> query('use b12_6588581_ware');
    $sql = $mysqli -> query('set name utf8');

    // �������ݱ�
    $sql = $mysqli -> query("create table hacker(
        id char(6) not null,
        name char(8) not null,
        chinese float not null,
        math float not null,
        english float not null
    )");
    if($sql == true){
        echo '�ɹ�����hacker��<br>';
    }else{
        echo '����hacker��ʧ�ܣ�'.$mysqli->error.'<br>';
    }

    // ������ݡ���hacker
    // $sql  = "insert into hacker values('1','����','10','20','30');"; 
    // $sql  .= "insert into hacker values('2','����','66','77','88');"; 
    // $sql .= "insert into hacker values('3','����','55','44','33');"; 
    // $sql .= "insert into hacker values('4','����','22','55','77')"; 
    // $rows = $mysqli->affected_rows;
    // if($rows == 3){
    //     echo "������ݳɹ���<br>";
    // }else{
    //     echo '���ʧ�ܡ�'.$mysqli->error."<br>";
    // }

    $sql = $mysqli -> query("insert into hacker
        values('2','����','66','77','88')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "������ݳɹ���<br>";
    }else{
        echo '���ʧ�ܡ�'.$mysqli->error."<br>";
    }
    $sql = $mysqli -> query("insert into hacker
        values('3','����','55','44','33')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "������ݳɹ���<br>";
    }else{
        echo '���ʧ�ܡ�'.$mysqli->error."<br>";
    }
    $sql = $mysqli -> query("insert into hacker
        values('4','����','22','55','77')
    ");
    $rows = $mysqli->affected_rows;
    if($rows == 1){
        echo "������ݳɹ���<br>";
    }else{
        echo '���ʧ�ܡ�'.$mysqli->error."<br>";
    }

    // ���ݲ�ѯ
    $sql = $mysqli->query("select * from hacker");
    if($sql){
        // echo '�����ݣ�<br>';
        $rows = $sql->num_rows;
        echo '��ѯ�������'.$rows.'����¼<br>';
        echo "<table>
                <tr>
                    <th>���</th>
                    <th>����</th>
                    <th>����</th>
                    <th>��ѧ</th>
                    <th>Ӣ��</th>
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
            echo 'û����Ҫ�ҵ����ݡ�<br>';
        }
    }else{
        echo 'MySQL�������<br>'.$mysqli->error.'<br>';
    }

?>
