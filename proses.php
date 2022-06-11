<?php
session_start();
// mengecek, apakan halaman ini dibuka secara langsung atau melalui index
if(!isset($uname) || !isset($passw)){
    header("location: index.php");
} elseif (empty($uname) || empty($passw)){

}

include "koneksi.php";

$uname = $_POST['uname'];
$passw = $_POST['passw'];

//Pengecekan
$qry = "SELECT * FROM admin WHERE uname = '$uname' AND passw = '$passw'";
$sql = mysqli_query($kon, $qry);
$hsl = mysqli_fetch_array($sql);

if ($hsl['uname']) {
	// Smpan sesi
	$_SESSION['uname'] = $hsl ['uname'];
	echo '<script>alert("Login Berhasil!")</script>';
    echo '<script>window.location = "utama.php"</script>';
	// header("location: utama.php");
}else {
	echo '<script>alert("Username atau Password Salah!")</script>';
    echo '<script>window.location = "index.php"</script>';
	// header("location:index.php");
}

?>