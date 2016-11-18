<!DOCTYPE html>
<html>
<head>
	<title>createContestEntryPhp</title>
</head>
<body>
<?php
$contestId = '';
$contestName = '';
$user = '';
$winner = '';
$idol = '';
$entry = '';
if (isset($_POST["submit"])) {
        $serverName = "localhost";
        $username = "root";
        $password = "da13DA!#";
        $dbName = "fanspot";
    $contestId = $_POST['contestId'];
    $contestName = $_POST['contestName'];
    $user = $_POST['user'];
    $winner = $_POST['winner'];
    $idol = $_POST['idol'];
    $entry = $_POST['entry'];
        $conn = new mysqli($serverName, $username, $password, $dbName);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    $createContestEntry = $conn->prepare("CALL createContestEntry (?, ?, ?, ?, ?, ?);");
    $createContestEntry->bind_param("isssib", $contestId, $contestName, $user, $winner, $idol, $entry);
    $createContestEntry->execute();
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
    <input type="number" name="contestId"><br>
    <input type="text" name="contestName"><br>
    <input type="text" name="user"><br>
    <input type="text" name="idol"><br>
    <input type="number" name="winner"><br>
    <input type="blob" name="entry"><br>
	<input type="submit" name="submit" values="submit"><br>
</form>
</body>
</html>