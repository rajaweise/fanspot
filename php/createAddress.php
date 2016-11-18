<!DOCTYPE html>
<html>
<head>
	<title>Fanspot login1</title>
</head>
<body>
<?php
$streetName = '';
$city = '';
$state = '';
$country = '';
$zipcode = '';
$userId = '';
$userAddressNumber = '';
if (isset($_POST["submit"])) {
        $streetName = $_POST['streetName'];
        $city = $_POST['city'];
        $state = $_POST['state'];
        $country = $_POST["country"];
        $zipcode = $_POST['zipcode'];
        $userId = $_POST['userId'];
        $userAddressNumber = $_POST['userAddressNumber'];
        $serverName = "localhost";
        $username = "root";
        $password = "da13DA!#";
        $dbName = "fanspot"; 
        $conn = new mysqli($serverName, $username, $password, $dbName);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    $createAddress = $conn->prepare("CALL createAddress (?, ?, ?, ?, ?, ?, ?);");
    $createAddress->bind_param("ssssiii", $streetName, $city, $state, $country, $zipcode, $userId, $userAddressNumber);
    $createAddress->execute();
    print "it works!";
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
	<input type="text" name="city"><br>
	<input type="text" name="state"><br>
	<input type="text" name="country"><br>
	<input type="number" name="zipcode"><br>
	<input type="number" name="userId"><br>
	<input type="number" name="userAddressNumber"><br>
	<input type="submit" name="submit"><br>
</form>
</body>
</html>