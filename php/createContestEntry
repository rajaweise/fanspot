<!DOCTYPE html>
<html>
<head>
	<title>Fanspot login1</title>
</head>
<body>
<?php
$streetName = '';
if (isset($_POST["submit"])) {
        $streetName = $_POST['streetName'];
        $serverName = "localhost";
        $username = "root";
        $password = "da13DA!#";
        $dbName = "fanspot";
        $conn = new mysqli($serverName, $username, $password, $dbName);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    $stmt = $conn->prepare("INSERT INTO address (streetName) VALUES (?)");
    $stmt->bind_param("s", $streetName);
    $stmt->execute();
        echo $streetName . "New records created successfully";
    }

?>

<!DOCTYPE html>
<html>
<head>
	<title>Create Address</title>
</head>
<body>
<form method="post" action="">
    <input type="text" name="streetName"><br>
	<input type="submit" name="submit" values="submit"><br>
</form>
</body>
</html>