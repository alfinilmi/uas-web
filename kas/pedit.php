<?php 
// koneksi database
include '../koneksi.php';
 
// menangkap data yang di kirim dari form
$id = $_POST['id'];
$nis = $_POST['nis'];
$bulan = $_POST['bulan'];
$pekan1 = $_POST['pekan1'];
$pekan2 = $_POST['pekan2'];
$pekan3 = $_POST['pekan3'];
$pekan4 = $_POST['pekan4'];
 
// update data ke database
// mysqli_query($kon,"update kas set nis='$nis', bulan='$bulan', pekan1='$pekan1', pekan2='$pekan2', pekan3='$pekan3',
//                 pekan4='$pekan4' where id='$id'");
 
// // mengalihkan halaman kembali ke index.php
// header("location:kas.php");
$sql = "CALL ditkas('$id','$nis','$bulan','$pekan1','$pekan2','$pekan3','$pekan4')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: kas.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: edit.php?status=gagal');
    }
?>