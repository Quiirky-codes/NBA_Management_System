<!DOCTYPE html>
<html>
<head>
<title>Q5</title>
<style>
body {background-color: white;}
table {
border-collapse: collapse;
width: 98%;
color: rgb(6, 25, 34);
font-family: monospace;
font-size: 25px;
text-align: left;
}
th {
background-color: #17408b;
color: white;
}
tr:nth-child(even) {background-color: #fdb927}
.button {
  background-color: #fdb927; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
 
}
.container{  
  display: flex;
  justify-content: center;
  align-items: center;
  height: 200px;
   }
</style>
</head>
<body>
<link rel="stylesheet" href="w3.css">
<table align="center" class='w3-container w3-center'>
<tr>
<th>TEAM NAME</th>
<th>WIN %</th>
<th>WON</th>
<th>TOTAL PLAYED</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "nba");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

$t = $_POST['team'];

$sql1 = "SELECT DISTINCT(home_id),(((select count(result) from games where result='$t')/((SELECT count(home_id) from games where home_id='$t')+(SELECT count(away_id) from games WHERE away_id='$t')))*100) as 'win%',((SELECT count(home_id) from games where home_id='$t')+(SELECT count(away_id) from games WHERE away_id='$t')) as 'TTL',(select count(result) from games where result='$t') as 'WON'
from games
where home_id = '$t'";
$result = $conn->query($sql1);
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["home_id"]. "</td><td>" . $row["win%"]    . "</td><td>" . $row["WON"]    . "</td><td>" . $row["TTL"]    . "</td></tr>";
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<div class='container'>
<button class="button" onclick="location.href='query.html'" type="button">BACK</button></div>
</table>
</body>
</html>