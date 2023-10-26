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
<a href='creer.php' class='btnC'><button type='submit'>Creer un option</button></a>
<form action="home.php" method="GET" class="form_filter">
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

    <button type="submit">Apply Filters</button>
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
// Initialize the SQL query
$sql = 'SELECT `Option`, `Département`, `OptionAraB`, `CodeOption` FROM Options ';
if (!empty($_GET['filterOption']) || !empty($_GET['filterDepartment'])) {
    $sql .= 'WHERE ';
    $conditions = array();
    if (!empty($_GET['filterOption'])) {
        $conditions[] = '`Option` = "' . $_GET['filterOption'] . '"';
    }
    if (!empty($_GET['filterDepartment'])) {
        $conditions[] = '`Département` = "' . $_GET['filterDepartment'] . '"';
    }
    $sql .= implode(' AND ', $conditions);
}

if (isset($_GET['order']) && $_GET['order'] === 'CodeOption') {
    $sql .= ' ORDER BY CodeOption ASC';
} else {
    $sql .= ' ORDER BY Option ASC, Département ASC';
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {

    echo "<table class='table_f'>";
    echo "<tr><th>Option</th><th>Département</th>
        <th>OptionAraB</th><th>CodeOption</th><th colspan='2'>Operation</th></tr>";

    while ($row = $result->fetch_assoc()) {

        echo "<tr><td>" . $row['Option'] . "</td><td>" . $row['Département'] . "</td>
            <td>" . $row['OptionAraB'] . "</td><td>" . $row['CodeOption'] .
            "</td><form action='crud.php' method='POST'>
            <td><button type='submit' name='delete' class='supp'>Supprimer</button>
            </td></form><td><a href='update.php?Option=" . $row['Option'] . "&Département=" . $row['Département'] . "'>
            <button type='submit' class='update'>Update</button></a></td>
            </tr>";
    }

    echo "</table>";
}

else {
    echo "No items found.";
}

$conn->close();
?>

</body>
</html>
