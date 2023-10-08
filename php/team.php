<html>
<head>
<title>TEAM INSERT</title>
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
<th>TEAM ID</th>
<th>TEAM NAME</th>
<th>OWNER</th>
<th>STADIUM ID</th>
</tr>
<?php 

$host="localhost";
$user="root";
$password="";
$db="nba";

$conn = mysqli_connect($host, $user, $password,$db);

$tid = $_POST['tid'];
$tname = $_POST['tname'];
$own = $_POST['own'];
$sid = $_POST['sid'];



$sql="insert into team values ('$tid','$tname','$own','$sid')";

if(mysqli_query($conn, $sql)){
$sql1 = "select * from team where team_id = '$tid' ";
$result = $conn->query($sql1);
if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["team_id"]. "</td><td>" . $row["team_name"]    . "</td><td>"
. $row["owner"]. "</td><td>" .$row["stad_id"] . "</td></tr>";
}
} 
}else{
echo "ERROR: Hush! Sorry $sql. "
. mysqli_error($conn);
}
mysqli_close($conn);
?>
</table>
<div class='container'>
<button class="button" onclick="location.href='team.html'" type="button">BACK</button></div>
</body>
</html>