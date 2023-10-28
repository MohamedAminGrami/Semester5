<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Scolarite";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Échec de la connexion à la base de données: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['create'])) {
        $option = $_POST['Option'];
        $département = $_POST['Département'];
        $optionAraB = $_POST['OptionAraB'];
        $codeOption = intval($_POST['CodeOption']);

        $checkSql = "SELECT COUNT(*) FROM Options WHERE `Option` = ? AND `Département` = ?";

        $checkStmt = $conn->prepare($checkSql);
        $checkStmt->bind_param("ss", $option, $département);
        $checkStmt->execute();
        $checkStmt->bind_result($count);
        $checkStmt->fetch();
        $checkStmt->close();

        if ($count > 0) {
            echo "Cette Option Département combination existe deja.";
        } else {
            $insertSql = "INSERT INTO Options (`Option`, `Département`, `OptionAraB`, `CodeOption`) VALUES (?, ?, ?, ?)";
            $insertStmt = $conn->prepare($insertSql);
            $insertStmt->bind_param("sssi", $option, $département, $optionAraB, $codeOption);
            if ($insertStmt->execute()) {
                header("Location: home.php");
            } else {
                echo "Erreur à la création: " . $insertStmt->error;
            }
            $insertStmt->close();
        }
    } elseif (isset($_POST['update'])) {
        $option = $_POST['Option'];
        $département = $_POST['Département'];
        $optionAraB = $_POST['OptionAraB'];
        $codeOption = intval($_POST['CodeOption']);

        $sql = "UPDATE Options 
            SET `OptionAraB` = ?, `CodeOption` = ?
            WHERE `Option` = ? AND `Département` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("siss", $optionAraB, $codeOption, $option, $département);

        if ($stmt->execute()) {
            // echo "updated";
            header("Location:home.php");
        } else {
            echo "Erreur : " . $stmt->error;
        }
        $stmt->close();
    }
}
$conn->close();
?>
