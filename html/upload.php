<?php
$uploads_dir = '/var/www/html/uploads_dir';

$error = $_FILES['upfiles']['error'];
$name = $_FILES['upfiles']['name'];

if($error != UPLOAD_ERR_OK){
	switch($error){
		case UPLOAD_ERR_INI_SIZE:
		case UPLOAD_ERR_FROM_SIZE:
			echo "File is too large. ($error)";
			break;
		case UPLOAD_ERR_NO_SIZE:
			echo "File is not attached. ($error)";
			break;
		default:
			echo "File is not uploaded. ($error)";
	}
	exit;
}else{
	echo "success!<br />";
	move_uploaded_file($_FILES['upfiles']['tmp_name'], "$uploads_dir/$name");
	echo "<img src = {$_FILES['upfiles']['name']}/> <p>";
}
?>
		



