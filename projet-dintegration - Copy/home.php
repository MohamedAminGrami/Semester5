<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style.css">
    <title>List of Items</title>
</head>
<body>
<h1>List of Items</h1>
<a href='creer.php' class='btnC'><button type='submit'>Create an Option</button></a>
<form action="crud.php" method="POST" class="form_filter">
    <label for="filterOption">Filter by Option:</label>
    <select name="filterOption" id="filterOption">
        <option value="">All</option>
        <option value="Option1">Option 1</option>
        <option value="Option2">Option 2</option>
        <option value="Option3">Option 3</option>
        <option value="Option4">Option 4</option>
    </select>
    <label for="filterDepartment">Filter by Department:</label>
    <select name="filterDepartment" id="filterDepartment">
        <option value="">All</option>
        <option value="info">info</option>
        <option value="electrique">electrique</option>
        <option value="mechanique">mechanique</option>
        <option value="buisness">buisness</option>
    </select>

    <label for="order">Order by CodeOption:</label>
    <input type="radio" name="order" value="CodeOption" id="orderCodeOption">
    <br/>

    <button type="submit" name="filter" value="Apply Filters">Apply Filters</button>
</form>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Scolarite";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = 'SELECT `Option`, `Département`, `OptionAraB`, `CodeOption` FROM Options ';
if (isset($_POST['filter'])) {
    $conditions = array();
    if (!empty($_POST['filterOption'])) {
        $conditions[] = '`Option` = "' . $_POST['filterOption'] . '"';
    }
    if (!empty($_POST['filterDepartment'])) {
        $conditions[] = '`Département` = "' . $_POST['filterDepartment'] . '"';
    }
    if (count($conditions) > 0) {
        $sql .= ' WHERE ' . implode(' AND ', $conditions);
    }
}

if (isset($_POST['order']) && $_POST['order'] === 'CodeOption') {
    $sql .= ' ORDER BY CodeOption ASC';
} else {
    $sql .= ' ORDER BY Option ASC, Département ASC';
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table class='table_f'>";
    echo "<tr><th>Option</th><th>Département</th><th>OptionAraB</th><th>CodeOption</th><th colspan='2'>Operation</th></tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row['Option'] . "</td>";
        echo "<td>" . $row['Département'] . "</td>";
        echo "<td>" . $row['OptionAraB'] . "</td>";
        echo "<td>" . $row['CodeOption'] . "</td>";
        echo "<td>";
        echo "<form action='supp.php' method='POST'>";
        echo "<input type='hidden' name='Option' value='" . htmlspecialchars($row['Option']) . "'>";
        echo "<input type='hidden' name='Département' value='" . htmlspecialchars($row['Département']) . "'>";
        echo "<button type='submit' name='supp' class='supp'>Delete</button>";
        echo "</form>";
        echo "</td>";
        echo "<td>";
        echo "<a href='update.php?Option=" . $row['Option'] . "&Département=" . $row['Département'] . "'>";
        echo "<button type='submit' class='update'>Update</button>";
        echo "</a>";
        echo "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "No items found.";
}

$conn->close();
?>
</body>
</html>
