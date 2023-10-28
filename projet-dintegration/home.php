<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="styles/style.css"> -->
    <title>List of Items</title>
</head>
<body>
<h1>List of Items</h1>
<a href='creer.php'><button type='submit' class='btnC'>Create an Option</button></a><br/>
<form action="home.php" method="GET" class="form_filter">
    <label for="filterOption">Filter by Option:</label>
    <select name="filterOption" id="filterOption">
        <option value="">All</option>
        <option value="Option 1">Option 1</option>
        <option value="Option 2">Option 2</option>
        <option value="Option 3">Option 3</option>
        <option value="Option 4">Option 4</option>
    </select>
    <label for="filterDepartment">Filter by Department:</label>
    <select name="filterDepartment" id="filterDepartment">
        <option value="">All</option>
        <option value="info">info</option>
        <option value="électrique">électrique</option>
        <option value="mechanique">mechanique</option>
        <option value="buisness">buisness</option>
    </select>

    <label for="order">Order by CodeOption:</label>
    <button type="submit">Apply Filters</button>
</form>
<br/>

<?php
include("db_connection.php");
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
