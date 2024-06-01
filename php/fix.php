<!DOCTYPE html>
<html>
<head>
<title>GAME DETAILS</title>
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

   .rb{
  background-color:white;
}

.y{
  background-color:#FF9494;
  color:white;
}

.b{
  border: 0px solid black;
}
</style>
</head>
<body>

<link rel="stylesheet" href="w3.css">
<table align="center" class='w3-container w3-center'>
<tr>
<th>GAME ID</th>
<th>HOME TEAM</th>
<th>AWAY TEAM</th>
<th>STADIUM ID</th>
<th>RESULT</th>
<th>DATE</th>
<th>SPONSOR ID</th>
</tr>
<?php
$id = $_POST['id'];
$res = $_POST['res'];
$conn = mysqli_connect("localhost", "root", "", "nba");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

$sql1 = "UPDATE games SET result = '$res' WHERE games.g_id = $id ";
$ress = $conn->query($sql1);
$sql = "select * from games where g_id = $id ";
$sql2 = "select * from games where g_id = $id ";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  $result1 = $conn->query($sql2);
  $row1 = $result1->fetch_assoc();
  if ($row1["result"]=='???'){ 
  echo '<header class="w3-container w3-center w3-padding-48 rb b">';
  echo "<div class='w3-text-black'>";
  echo '<div>';
  echo "<h2 class='y'>HOME TEAM: ".$row1["home_id"]."</h2> ";
  echo "<h2 class='y'>VS </h2> ";
  echo "<h2 class='y'>AWAY TEAM: ".$row1["away_id"]."</h2> ";
  echo "<h2 class='y'>THE RESULT CANNOT BE ".$res."</h2> ";
  echo "<h2 class='y'>INSERT A PROPER RESULT</h2> ";
  echo '</div>';}
  else { 


  }
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["g_id"]. "</td><td>" . $row["home_id"]    . "</td><td>"
. $row["away_id"]. "</td><td>" .$row["s_id"] . "</td><td>" .$row["result"] . "</td><td>" .$row["date"] . "</td><td>" .$row["spo_id"] . "</td></tr>";
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<div class='container'>
<button class="button" onclick="location.href='fix.html'" type="button">BACK</button></div>
</table>
</body>
</html>