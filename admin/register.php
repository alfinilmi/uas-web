<?php include '../design/awal.php'; ?>

<div class="container-fluid">

  <!-- Breadcrumbs-->
  <ol class="breadcrumb">
    <li class="breadcrumb-item active">Tambah Data Admin</li>
  </ol>

    <!-- DataTables Example -->
    <div class="card mb-3">
    <div class="card-header">
    <i class="fas fa-table"></i>
        Tambah Data Pengguna
    <div class="section">
    <div id="slider" margin="20px">
    <br>
    <form action="ptambah.php" method="post">
    <table class="table">
        <tr>
            <td>Username</td>
            <td>:</td>
            <td><input type="text" class="form-control" name="uname" id="uname" autocomplete="off" placeholder="Masukan Username" size="30" required></td>
        </tr>
        <tr>
        <tr>
            <td>Password</td>
            <td>:</td>
            <td><input type="password" class="form-control" name="passw" id="passw" autocomplete="off" placeholder="Masukan Password" size="30" required></td>
        </tr>
        <td><input type="submit" class="btn btn-primary" name="tambah" value="Tambah">
        <input type="button" name="batal" class="btn btn-danger"  value="Batal" onClick="javascript:history.back()"></td>
    </tr>
    </div>
    </table>
    </form>

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
<i class="fas fa-angle-up"></i>
</a>



<?php include '../design/akhir.php' ?>