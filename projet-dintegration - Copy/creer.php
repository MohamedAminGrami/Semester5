<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Options</title>
    <link rel="stylesheet" href="styles/style.css">
</head>
<body>
    <h1>Options</h1>
    <form action="crud.php" method="POST">
        <label for="Option">Option:</label>
        <select name="Option" id="Option" required>
            <option value="Option1">Option 1</option>
            <option value="Option2">Option 2</option>
            <option value="Option3">Option 3</option>
            <option value="Option4">Option 4</option>
        </select>

        <label for="Département">Département:</label>
        <select name="Département" id="Département" required>
            <option value="info">info</option>
            <option value="electrique">electrique</option>
            <option value="mechanique">mechanique</option>
            <option value="buisness">buisness</option>
        </select>

        <label for="OptionAraB">OptionAraB:</label>
        <input type="text" id="OptionAraB" name="OptionAraB" maxlength="10" required>
        
        <label for="CodeOption">CodeOption:</label>
        <input type="number" min="1" maxlength="10" id="CodeOption" name="CodeOption" required>
        
        <button type="submit" name="create" class="update">Créer</button>
        
    </form>
    
</body>
</html>
