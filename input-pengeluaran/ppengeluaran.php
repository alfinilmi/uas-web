<?php

if (isset ($_POST['tambah'])){
    include('../koneksi.php');
    
    $total = $_POST['total'];
    $tgl= $_POST['tgl'];
    $ket = $_POST['ket'];

    // query...
    // $sql = "INSERT into riwayat_keuangan values (NULL, '$total', '$tgl', 'keluar', '$ket')";
    // $query = mysqli_query($kon, $sql);

    // if( $query ) {
    //     // kalau berhasil alihkan ke halaman sebelumnya dengan status=sukses
    //     header('Location: ../pengeluaran/pengeluaran.php?status=sukses');
    // } else {
    //     // kalau gagal alihkan ke halaman indek.php dengan status=gagal
    //     header('Location: pengeluaran.php?status=gagal');
    // }

    // coba pake TRANSACTION
    mysqli_begin_transaction($kon);

    try {
        /* Insert some values */
        $sql = "INSERT into riwayat_keuangan values (NULL, '$total', '$tgl', 'keluar', '$ket')";
        $query = mysqli_query($kon, $sql);

        mysqli_commit($kon);
        // header("location: ../pengeluaran/pengeluaran.php");
        echo '<script>alert("Pelaporan Berhasil!")</script>';
        echo '<script>window.location = "../pengeluaran/pengeluaran.php"</script>';
        
    } catch (mysqli_sql_exception $exception) {
        mysqli_rollback($kon);
        // header("location: pengeluaran.php");
        echo '<script>alert("Pelaporan Gagal!")</script>';
        echo '<script>window.location = "./pengeluaran.php"</script>';
        throw $exception;
    }
    
    
}

?>