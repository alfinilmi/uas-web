<?php
// if (isset ($_POST['tambah'])){
    include('../koneksi.php');

    $id = $_POST['id'];
    $nis = $_POST['nis'];
    $bulan= $_POST['bulan'];
    $pekan1= $_POST['pekan1'];
    $pekan2= $_POST['pekan2'];
    $pekan3= $_POST['pekan3'];
    $pekan4= $_POST['pekan4'];

    //query pake procedure
    // mysqli_query($kon,"CALL ditadmin('$id','$uname','$passw')");

    // header("location:admin.php");
    $sql = "CALL ditadmin('$id','$nis','$bulan','$pekan1','$pekan2','$pekan3','$pekan4')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        header('Location: kas.php?status=sukses');
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        header('Location: edit.php?status=gagal');
    }
// }
?>