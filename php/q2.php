<!DOCTYPE html>
<html>
<head>
<title>SPONSOR DETAILS</title>
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
  padding: 15px 36px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 6px 6px;
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
  background-color:#17408b;
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
<th>DATE</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "nba");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

$t = $_POST['team'];

$sql1 = "select sponser_name,g_id,g.date
from sponser , games g
where sponser_id=spo_id and spo_id = $t";
$sql2 = "select sponser_name,g_id,g.date
from sponser , games g
where sponser_id=spo_id and spo_id = $t";
$result = $conn->query($sql1);
$result1 = $conn->query($sql2);
if ($result->num_rows > 0) {
$row = $result->fetch_assoc();
  echo '<header class="w3-container w3-center w3-padding-48 rb b">';
  echo "<div class='w3-text-black'>";
  echo '<div>';
  echo "<h2 class='y'>SPONSOR NAME: ".$row["sponser_name"]."</h2> ";
  echo '</div>';
  
while($row1 = $result1->fetch_assoc()) {
echo "<tr><td>" . $row1["g_id"]    . "</td><td>"
. $row1["date"]. "</td></tr>";
}
echo "</div>";
  echo '</header>';
 
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<div class='container'>
<button class="button" onclick="location.href='q2.html'" type="button">BACK</button></div>
</table>
</body>
</html>