<?php
if (isset ($_POST['tambah'])){
    include('../koneksi.php');

    
    $uname = $_POST['uname'];
    $passw= $_POST['passw'];

    //query pake procedure
    $sql = "CALL tadmin ('$uname', '$passw')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: admin.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: register.php?status=gagal');
    }
}
?>