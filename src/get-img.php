<?php
require_once 'include/connect.php';

$imageId = $_GET['id'] ?? 0;

try {
    $result = $connect->query("SELECT * FROM image WHERE image_id = $imageId");

    if ($result->rowcount() === 1) {
        $image = $result->fetchObject();
        header('Content-Type: ' . $image->mimetype);
        echo $image->img_data;
    }
} catch (PDOException) {
    die();
} 