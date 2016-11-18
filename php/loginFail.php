    <?php

    $userEmail = "rajaweise@gmail.com";
    $userPassword = "password"; 
    $dbserverName = "localhost";
    $dbUsername = "root";
    $dbPassword = "da13DA!#";
    $dbName = "fanspot"; 
    $conn = new mysqli($dbserverName, $dbUsername, $dbPassword, $dbName);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $selectLoginInformationByEmail = $conn->prepare("CALL selectLoginInformationByEmail (?);");
    $selectLoginInformationByEmail->bind_param("s", $userEmail);
    $selectLoginInformationByEmail->execute();
    if(!$selectLoginInformationByEmail) {die("CALL failed: (" . $mysqli->errno . ") " . $mysqli->error);}
        while($row = mysqli_fetch_array($selectLoginInformationByEmail, MYSQLI_ASSOC))
        {
            $foundPassword = $row["userPassword"];
        }
    echo $foundPassword;
if ($userEmail !== '' ) {
if ($userPassword === $foundPassword) {
echo json_encode(array('result' => true));// this is response, true or false
exit;}
else {
echo json_encode(array('result' => false));// this is response, true or false
exit;
}

} else {
    echo json_encode(array('result' => false));
}
?>
