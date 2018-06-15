<?php

$uploads_dir = '/mnt/d/img';

 

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
    #echo "success!<br />";
    move_uploaded_file($_FILES['upfiles']['tmp_name'], "$uploads_dir/$name");
    #echo "<img src = {$_FILES['upfiles']['name']}/> <p>";

}

$command = escapeshellcmd("python /home/lee/OpenFace/openface/demos/classifier.py infer /mnt/c/Users/user/Desktop/capst/model/generated-embeddings-20180510/classifier.pkl /mnt/d/img/".$name);
$output = shell_exec($command);
#echo "<br/>";
echo $output;
#$date = date("Y-m-d");
$db_host="snivy92.cafe24.com";
$db_user="snivy92";
$db_passwd = "android3";
$db_name = "snivy92";
$connect = mysqli_connect($db_host,$db_user,$db_passwd,$db_name);
if(mysqli_connect_errno($connect)){
echo "데이터베이스 연결 실패: ". mysqli_connect_error();
}else{
#echo $date;
mysqli_query($connect, "INSERT INTO door_lock(who,file_path)VALUES('$output','$uploads_dir/$name')");

}

?>
