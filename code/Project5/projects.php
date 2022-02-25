<?php
$user = "example_user";
$password = "Password_123";
$database = "example_database";
$table = "projects";

try {
  $db = new PDO("mysql:host=172.31.40.100;dbname=$database", $user, $password);
  echo "<h2>Projects</h2><ol>";
  foreach($db->query("SELECT project_name FROM $table") as $row) {
    echo "<li>" . $row['project_name'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}