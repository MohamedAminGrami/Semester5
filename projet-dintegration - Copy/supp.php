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
    if (isset($_POST['supp'])) {
        if (isset($_POST['Option']) && isset($_POST['Département'])) {
            $option = $_POST['Option'];
            $département = $_POST['Département'];

            $sql = "DELETE FROM Options WHERE `Option` = ? AND `Département` = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $option, $département);

            if ($stmt->execute()) {
                header("Location: home.php");
            } else {
                echo "Error deleting record: " . $stmt->error;
            }
            $stmt->close();
        } else {
            echo "Option and Département are not set in the POST request.";
        }
    }
}
$conn->close();
?>
