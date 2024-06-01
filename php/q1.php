<!DOCTYPE html>
<html>
<head>
<title>Q2</title>
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
<th>PLAYER NAME</th>
<th>2P</th>
<th>3P</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "nba");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

$t = $_POST['team'];

$sql1 = "select team_name,owner,stadium_name,location,coach_name,p_name,2p,3p
from team , stadium , coach , squad 
where team_id = '$t' and stad_id = stadium_id and head_c_id = coach_id and te_id = '$t'
order by 2p desc";
$sql2 = "select team_name,owner,stadium_name,location,coach_name,p_name,2p,3p
from team , stadium , coach , squad 
where team_id = '$t' and stad_id = stadium_id and head_c_id = coach_id and te_id = '$t'
order by 2p desc";
$result = $conn->query($sql1);
$result1 = $conn->query($sql2);
if ($result->num_rows > 0) {
  $row = $result->fetch_assoc();
  echo '<header class="w3-container w3-center w3-padding-48 rb b">';
  echo "<div class='w3-text-black'>";
  echo '<div>';
  echo "<h2 class='y'>TEAM NAME: ".$row["team_name"]."</h2> ";
  echo "<h2 class='y'>STADIUM NAME: ".$row["stadium_name"]."</h2> ";
  echo "<h2 class='y'>LOCATION: ".$row["location"]."</h2> ";
  echo "<h2 class='y'>OWNER: ".$row["owner"]."</h2> ";
  echo "<h2 class='y'>COACH NAME: ".$row["coach_name"]."</h2> ";
  echo '</div>';
  
while($row = $result1->fetch_assoc()) {
echo "<tr><td>" .$row["p_name"] . "</td><td>" .$row["2p"] . "</td><td>" .$row["3p"] . "</td></tr>";
}

echo "</div>";
  echo '</header>';
 
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<div class='container'>
<button class="button" onclick="location.href='q1.html'" type="button">BACK</button></div>
</table>
</body>
</html>