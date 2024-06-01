<html>
<head>
<title>SQUAD INSERT</title>
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
<th>STADIUM ID</th>
<th>STADIUM NAME</th>
<th>LOCATION</th>
<th>SEATS</th>
</tr>
<?php 

$host="localhost";
$user="root";
$password="";
$db="nba";

$conn = mysqli_connect($host, $user, $password,$db);

$sname = $_POST['sname'];
$loc = $_POST['loc'];
$seats = $_POST['seats'];



$sql="insert into STADIUM values ('NULL','$sname','$loc','$seats')";

if(mysqli_query($conn, $sql)){
$sql1 = "select * from stadium ORDER BY stadium_id DESC LIMIT 1";
$result = $conn->query($sql1);
if ($result->num_rows > 0) {
// output data of each row
while($row = $result->fetch_assoc()) {
echo "<tr><td>" . $row["stadium_id"]. "</td><td>" . $row["stadium_name"]    . "</td><td>"
. $row["location"]. "</td><td>" .$row["seats"] . "</td></tr>";
}
} 
} else{
echo "ERROR: Hush! Sorry $sql. "
. mysqli_error($conn);
}
mysqli_close($conn);
?>
</table>
<div class='container'>
<button class="button" onclick="location.href='stadium.html'" type="button">BACK</button></div>
</body>
</html>