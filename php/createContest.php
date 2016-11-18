<!DOCTYPE html>
<html>
<head>
	<title>Fanspot login1</title>
</head>
<body>
<?php
$idolName = '';
$contestName = '';
$rewardFanpoints = '';
$rewardCash = '';
$rewardOther = '';
$contestType = '';
$contestEnds = '';
$price = '';
$contestWinner = '';
$contestDescription = '';
$idolId = '';
if (isset($_POST['submit'])) {
    $idolName = $_POST['idolName'];
    $contestName = $_POST['contestName'];
    $rewardFanpoints = $_POST['rewardFanpoints'];
    $rewardCash = $_POST['rewardCash'];
    $rewardOther = $_POST['rewardOther'];
    $contestType = $_POST['contestType'];
    $contestEnds = $_POST['contestEnds'];
    $price = $_POST['price'];
    $contestWinner = $_POST['contestWinner'];
    $contestDescription = $_POST['contestDescription'];
    $idolId = $_POST['idolId'];
        $serverName = "localhost";
        $username = "root";
        $password = "da13DA!#";
        $dbName = "fanspot";
        $conn = new mysqli($serverName, $username, $password, $dbName);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    $createContest = $conn->prepare("CALL createContest (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
    $createContest->bind_param("ssiisisissi", $idolName, $contestName, $rewardFanpoints, $rewardCash, $rewardOther, $contestType, $contestEnds, $price, $contestWinner, $contestDescription, $idolId);
    $createContest->execute();
    print "it works!";
}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Create Contest</title>
</head>
    <?php
    if ('') {
        print 'itworks!';
    }
    ?>
<body>
<form method="post" action="">
    <input type="text" name="idolName"><br>
	<input type="text" name="contestName"><br>
	<input type="number" name="rewardFanpoints"><br>
	<input type="number" name="rewardCash"><br>
	<input type="text" name="rewardOther"><br>
	<input type="number" name="contestType"><br>
	<input type="date" name="contestEnds"><br>
	<input type="number" name="price"><br>
	<input type="text" name="contestWinner"><br>
	<input type="text" name="contestDescription"><br>
	<input type="number" name="idolId"><br>
	<input type="submit" name="submit"><br>
</form>
</body>
</html>