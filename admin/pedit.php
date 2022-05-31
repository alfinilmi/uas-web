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
        header('Location: admin.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: edit  .php?status=gagal');
    }
// }
?>