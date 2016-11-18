<!DOCTYPE html>
<html>
<head>
	<title>createFan</title>
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
    /* user, idol, idolId, fanpoints, contestEntries, contestWins, firstDegreeReferrals, secondDegreeReferrals, thirdDegreeReferrals, 321Deal, referee, position */
<!DOCTYPE html>
<html>
<head>
	<title>Create Address</title>
</head>
<body>
<form method="post" action="">
    <input type="text" name="user"><br>
	<input type="text" name="idol"><br>
	<input type="number" name="idolId"><br>
	<input type="number" name="fanpoints"><br>
	<input type="number" name="contestEntries"><br>
	<input type="number" name="contestWins"><br>
	<input type="number" name="firstDegreeReferrals"><br>
	<input type="number" name="secondDegreeReferrals"><br>
	<input type="number" name="thirdDegreeReferrals"><br>
	<input type="number" name="321Deal"><br>
	<input type="text" name="referee"><br>
	<input type="number" name="position"><br>
	<input type="submit" name="submit"><br>
</form>
</body>
</html>