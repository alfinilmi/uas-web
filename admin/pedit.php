<?php
// if (isset ($_POST['tambah'])){
    include('../koneksi.php');

    $id = $_POST['id'];
    $uname = $_POST['uname'];
    $passw= $_POST['passw'];

    //query pake procedure
    // mysqli_query($kon,"CALL ditadmin('$id','$uname','$passw')");

    // header("location:admin.php");
    $sql = "CALL ditadmin('$id','$uname','$passw')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        // header('Location: admin.php?status=sukses');
	echo '<script>alert("Edit Data Berhasil!")</script>';
    echo '<script>window.location = "./admin.php"</script>';
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        // header('Location: edit.php?status=gagal');
	echo '<script>alert("Edit data Gagal :(")</script>';
    echo '<script>window.location = "./edit.php"</script>';
    }
// }
?>