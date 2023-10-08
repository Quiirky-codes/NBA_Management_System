<!DOCTYPE html>
<html>
<head>
<title>SQUAD DETAILS</title>
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
<th>PLAYER ID</th>
<th>PLAYER NAME</th>
<th>HEAD COACH</th>
<th>TEAM</th>
<th>GAMES</th>
<th>2P</th>
<th>3P</th>
<th>AST</th>
<th>POS</th>
</tr>
<?php
$conn = mysqli_connect("localhost", "root", "", "nba");
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM squad order by 2p desc";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["p_id"]. "</td><td>" . $row["p_name"]    . "</td><td>"
. $row["head_c_id"]. "</td><td>" .$row["te_id"] . "</td><td>" .$row["games"] . "</td><td>" .$row["2p"] . "</td><td>" .$row["3p"] . "</td><td>" .$row["ast"] . "</td><td>" .$row["pos"] . "</td></tr>";
}
echo "</table>";
} else { echo "0 results"; }
$conn->close();
?>
<div class='container'>
<button class="button" onclick="location.href='view.html'" type="button">BACK</button></div>
</table>
</body>
</html>