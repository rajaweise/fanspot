<?php

$email = 'rajaweise@gmail.com';
$userPassword = 'password';        
$dbserverName = "localhost";
$dbUsername = "root";
$dbPassword = "da13DA!#";
$dbName = "fanspot"; 
$conn = new mysqli($dbserverName, $dbUsername, $dbPassword, $dbName);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$selectLoginInformationByEmail = $conn->prepare("CALL selectLoginInformationByEmail (?);");
$selectLoginInformationByEmail->bind_param("s", $email);
$selectLoginInformationByEmail->execute();
$foundPassword = mysqli_stmt_bind_result($selectLoginInformationByEmail, $foundPassword);

if ($userPassword == $foundPassword) {
echo json_encode(array('result' => true));// this is response, true or false
exit;
}
?>
