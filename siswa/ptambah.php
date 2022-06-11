<?php
if (isset ($_POST['tambah'])){
    include('../koneksi.php');

    $id = $_POST['id'];
    $nis = $_POST['nis'];
    $name= $_POST['name'];

    //query pake procedure
    $sql = "CALL tsiswa ('$id', '$nis', '$name')";
    $query = mysqli_query($kon, $sql);
    
    if( $query ) {
        // kalau berhasil alihkan ke halaman index.php dengan status=sukses
        // header('Location: siswa.php?status=sukses');
	echo '<script>alert("Tambah Data Berhasil!")</script>';
    echo '<script>window.location = "./siswa.php"</script>';
    } else {
        // kalau gagal alihkan ke halaman indek.php dengan status=gagal
        // header('Location: siswa.php?status=gagal');
	echo '<script>alert("Tambah Data Gagal :(")</script>';
    echo '<script>window.location = "./siswa.php"</script>';
    }
}
?>