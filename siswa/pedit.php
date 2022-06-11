<?php
//if (isset ($_POST['tambah'])){
    include('../koneksi.php');

    $id = $_POST['id'];
    $nis = $_POST['nis'];
    $name= $_POST['name'];

    //query pake procedure
    // mysqli_query($kon,"CALL ditadmin('$id','$uname','$passw')");

    // header("location:admin.php");
    $sql = "CALL ditsiswa('$id','$nis','$name')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
    // kalau berhasil alihkan ke halaman siswa.php dengan status=sukses
    // header('Location: siswa.php?status=sukses');
	echo '<script>alert("Edit Data Berhasil!")</script>';
    echo '<script>window.location = "./siswa.php"</script>';
    } else {
    // kalau gagal alihkan ke halaman indek.php dengan status=gagal
    // header('Location: edit.php?status=gagal');
	echo '<script>alert("Edit Data Gagal :(")</script>';
    echo '<script>window.location = "./siswa.php"</script>';
    }
// }
?>