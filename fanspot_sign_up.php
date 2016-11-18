<!DOCTYPE html>
<html>
	<head>
		<title>Fanspot Sign-Up</title>
		<?php
			$User_Name = '';
			$Password = '';
			$First_Name = '';
			$Last_Name = '';
			$email = '';
			$url_page = '';
			$ok = False;
			if (isset($_POST['submit'])) {
				 $ok = true;
				 $Idol_Name = $_POST['User_Name'];
				 $password = $_POST['Password'];
				 $First_Name = $_POST['First_Name'];
				 $Last_Name = $_POST['Last_Name'];
				 $email = $_POST['email'];
				if (!isset($_POST['User_Name']) || $_POST['User_Name'] === '') {
					$ok = false;
					echo 'please provide an user name';
				 }
				if (!isset($_POST['Password']) || $_POST['Password'] === '') {
					$ok = false;
					echo 'please provide a password';
				 }
				if (!isset($_POST['First_Name']) || $_POST['First_Name'] === '') {
					$ok = false;
					echo 'please provide a first name';
				 }
				if (!isset($_POST['Last_Name']) || $_POST['Last_Name'] === '') {
					$ok = false;
					echo 'please provide a last name';
				 }
				if (!isset($_POST['email']) || $_POST['email'] === '') {
					$ok = false;
					echo 'please provide an email';
				 }
				if ($ok) {
					$hash = password_hash($password, PASSWORD_DEFAULT);
					$db = mysqli_connect('localhost', 'root', 'da13DA!#', 'fanspot');
					$sql = sprintf("INSERT INTO registered_users ( User_Name, password, First_Name, Last_Name, Email)
							VALUES ('%s', '%s', '%s', '%s', '%s');",
					 mysqli_real_escape_string($db, $User_Name),
					 mysqli_real_escape_string($db, $hash),
					 mysqli_real_escape_string($db, $First_Name),
					 mysqli_real_escape_string($db, $Last_Name),
					 mysqli_real_escape_string($db, $email)
					 );
					 mysqli_query($db, $sql);
					 mysqli_close($db);
					 echo '<p>User Added!</p>';
				}
			}			
			?>
	</head>
	<body>
		<form method="post" action="">
			User Name <input type="text" name="User_Name" value="<?php echo htmlspecialchars($User_Name); ?>"><br>
			Password <input type="password" name="Password"><br>
			First Name <input type="text" name="First_Name" value="<?php echo  htmlspecialchars($First_Name); ?>"><br>
			Last Name <input type="text" name="Last_Name" value="<?php echo  htmlspecialchars($Last_Name); ?>"><br>
			Email <input type="email" name="email" value="<?php echo  htmlspecialchars($email); ?>"><br>
			<input type="submit" name="submit" value="Submit"><br>
		</form>
	</body>
</html>