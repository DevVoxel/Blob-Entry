<?php
if (isset($_FILES["upload"])) {
  try {
    require "include/connect.php";
    $type = $_FILES['upload']['type'];
    $stmt = $connect->prepare("INSERT INTO IMAGE (file_name, img_data, mimetype) VALUES (?,?,?)");
    $stmt->execute([
      $_FILES["upload"]["name"], 
      file_get_contents($_FILES['upload']['tmp_name']),
      $type
    ]);
    echo "Image Uploaded";
  } catch (Exception $ex) { echo $ex->getMessage(); }
}

$img1 = 1; #Grab the image under the IMAGE table that has an Id === 1.
$img2 = 2;
$img3 = 3;

?>

<!DOCTYPE html>
<head>  
    <title>Upload Image</title>
</head>
<html>
<body>
    <form method="post" enctype="multipart/form-data">
        <input type="file" name="upload" accept=".png,.gif,.jpg" required>
        <input type="submit" name="submit" value="Upload Image">
    </form>
</br>
    <a href="index.php">Home Page</a> </br>
    <img src="get-img.php?id=<?=$img1?>" alt="No Image" height="200">
    <img src="get-img.php?id=<?=$img2?>" alt="No Image" height="200">
    <img src="get-img.php?id=<?=$img3?>" alt="No Image" height="200">

</body>
</html>

