<?php

//$fp = fopen('manual_mode.txt', 'a+');
if(!empty($_GET['sw'])&&$_GET['sw'] == 1)
{
	file_put_contents('manual_mode.txt', '1');
	shell_exec('sudo python hcsr501.py &');
	echo 'start';
}
else
{	
	file_put_contents('manual_mode.txt', '0');
	//fwrite($fp, '0');
}

$str = file_get_contents('manual_mode.txt');
echo $str;	
?>
