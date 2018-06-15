<?php
	$link = mysqli_connect("localhost", "root", "1", "Hyungjoon");
	
	#temp = isset($_GET['temp'])?$_GET['temp']:'-999';
	#temp = isset($_GET['humi'])?$_GET['humi']:'-999';
	
	$sql = "insert into dht(id, temp, humi) values('1', '$temp', '$humi') on duplicate key update id = '1', temp = '$temp', humi ='$humi';  
	$result = mysqli_query($link, $sql)";
	
	echo "temp : $temp";
	echo "<br>";
	echo "humi : $humi";
?>