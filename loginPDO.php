<?php
    $userEmail = 'rajaweise@gmail.com';
    $dbserverName = "localhost";
    $dbUsername = "root";
    $dbPassword = "da13DA!#";
    $dbName = "fanspot"; 
    try {
        $pdo = new PDO("mysql:host=$dbserverName;dbname=$dbName", $dbUsername, $dbPassword);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $stmt = $pdo->prepare('CALL selectLoginInformationByEmail (?)');
        $stmt->bindValue(1, $userEmail, PDO::PARAM_STR);
        if ($stmt->execute()) {
            while ($row = $stmt->fetch()) {
                $foundPasswordRow = array_slice($row, 1, 1);
                $foundPassword = end($foundPasswordRow);
                $foundUsername = end($row);
            }
        }
    }
    catch(PDOException $e) {
        echo $e->getMessage();
    }
?>