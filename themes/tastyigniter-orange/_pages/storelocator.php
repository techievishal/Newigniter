---
title: main::lang.cart.title
layout: default
permalink: /storelocator/:slug/:slug/:slug


---

<?php

//require("phpsqlsearch_dbinfo.php");
$username="root";
$password="vagrant";
$database="igniter";
// Get parameters from URL

$center_lat = $_POST["lat"];
$center_lng = $_POST["lng"];
$radius = $_POST["radius"];



// Start XML file, create parent node

// Opens a connection to a mySQL server
$connection=mysqli_connect ('localhost', $username, $password);
if (!$connection) {
  die("Not connected : " . mysqli_error());
}
// Set the active mySQL database
$db_selected = mysqli_select_db( $connection,$database);
if (!$db_selected) {
  die ("Can\'t use db : " . mysqli_error());
}
// Search the rows in the markers table
$query = sprintf("SELECT id, name, address, lat, lng, ( 3959 * acos( cos( radians('%s') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('%s') ) + sin( radians('%s') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '%s' ORDER BY distance LIMIT 0 , 20",
  mysqli_real_escape_string($connection,$center_lat),
  mysqli_real_escape_string($connection,$center_lng),
  mysqli_real_escape_string($connection,$center_lat),
  mysqli_real_escape_string($connection,$radius));
$result = mysqli_query($connection,$query);

if (!$result) {
  die("Invalid query: " . mysqli_error());
}
//header("Content-type: text/xml");
// Iterate through the rows, adding XML nodes for each



$nearby = array();
while ($row = @mysqli_fetch_assoc($result)){
    $nearby[] = $row;
  /*$node = $dom->createElement("marker");
  $newnode = $parnode->appendChild($node);
  $newnode->setAttribute("id", $row['id']);
  $newnode->setAttribute("name", $row['name']);
  $newnode->setAttribute("address", $row['address']);
  $newnode->setAttribute("lat", $row['lat']);
  $newnode->setAttribute("lng", $row['lng']);
  $newnode->setAttribute("distance", $row['distance']); */
}
echo json_encode( $nearby );
exit;

?>