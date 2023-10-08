<html>
<head>
<title>GAME INSERT</title>
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
<th>GAME ID</th>
<th>HOME TEAM</th>
<th>AWAY TEAM</th>
<th>STADIUM ID</th>
<th>DATE</th>
<th>SPONSOR ID</th>
</tr>

<?php 

$host="localhost";
$user="root";
$password="";
$db="nba";

$conn = mysqli_connect($host, $user, $password,$db);

$h = $_POST['h'];
$a = $_POST['a'];
$sid = $_POST['sid'];
$d = $_POST['d'];
$sp = $_POST['sp'];


$sql="insert into games values (NULL,'$h','$a','$sid',NULL,'$d','$sp')";
if(mysqli_query($conn, $sql)){
$sql1 = "select * from games where date = '$d' and '$h' = home_id and '$a' = away_id ";
$result = $conn->query($sql1);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["g_id"]. "</td><td>" . $row["home_id"]    . "</td><td>"
. $row["away_id"]. "</td><td>" .$row["s_id"] . "</td><td>" .$row["date"] . "</td><td>" .$row["spo_id"] . "</td></tr>";
}
} 
} else{
    printf("Errormessage: %s\n", $mysqli->error);
}
mysqli_close($conn);?>
</table>  
<div class='container'>
<button class="button" onclick="location.href='game.html'" type="button">BACK</button></div>

</body>
</html>