<?php  

$link=mysqli_connect("localhost","snivy92","8888","snivy92"); 

 
$temp=isset($_GET['temp']) ? $_GET['temp'] : '-999';  
$humi=isset($_GET['humi']) ? $_GET['humi'] : '-999';  


$sql="insert into arduino(id, temp, humi) values('1','$temp','$humi') on duplicate key update id='1', temp='$temp', humi='$humi' ";

$result=mysqli_query($link,$sql);  


echo "temp : $temp";
echo "<br>";
echo "humi : $humi";

mysqli_close($link);
?>
