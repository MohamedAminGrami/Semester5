<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style.css">
    <title>Update Form</title>
</head>
<body>
<h1>Update Form:</h1>

<?php
if (isset($_GET['Option']) && isset($_GET['Département'])) {

    $option = $_GET['Option'];
    $département = $_GET['Département'];

    $conn = new mysqli("localhost", "root", "", "Scolarite");
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $sql = 'SELECT `Option`, `Département`, `OptionAraB`, `CodeOption` FROM Options WHERE `Option` = ? AND `Département` = ?';
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $option, $département);
    $stmt->execute();
    $stmt->bind_result($option, $département, $optionAraB, $codeOption);
    if ($stmt->fetch()) {
        echo '<form action="crud.php" method="POST">
                <input type="hidden" name="CodeOption" value="' . $codeOption . '">
                <label for="Option">Option:</label>
                <input type="text" id="Option" name="Option" value="'. $option . '" readonly>
                <label for="Département">Département:</label>
                <input type="text" id="Département" name="Département" value="' . $département . '" readonly>
                <label for="OptionAraB">OptionAraB:</label>
                <input type="text" id="OptionAraB" name="OptionAraB" value="' . $optionAraB . '" maxlength="10" required>
                <label for="codeOption">CodeOption:</label>
                <input type="number" min="1" id="codeOption" name="CodeOption" value="' . $codeOption . '">
                <button type="submit" name="update">Update</button>
            </form>';
    }
    else {
        echo "Record not found for Option: " . $option . " and Département: " . $département;
    }
    $stmt->close();
    $conn->close();
}
else {
    echo "Invalid or missing Option and Département parameters.";
}
?>
</body>
</html>
