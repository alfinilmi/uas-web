<?php include '../design/awal.php'; ?>

<div class="container-fluid">

  <!-- Breadcrumbs-->
  <ol class="breadcrumb">
    <li class="breadcrumb-item active">Edit Data Admin</li>
  </ol>

    <!-- DataTables Example -->
    <div class="card mb-3">
    <div class="card-header">
    <i class="fas fa-table"></i>
        Edit Data Admin
    <div class="section">
    <div id="slider" margin="20px">
    <br>
    <?php
	include '../koneksi.php';
	$id = $_GET['id'];
	$r = mysqli_query($kon,"select * from admin where id='$id'");
    while($d = mysqli_fetch_array($r)){
		?>
        
    <form action="pedit.php" method="post" >
    <table class="table">
        <tr>
            <td>Username</td>
            <td>:</td>
            <input type="hidden" name="id" value="<?php echo $d['id']?>"/>
            <td><input type="text" class="form-control" name="uname" id="uname" autocomplete="off" size="30" value="<?php echo $d['uname']?>" disabled></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>:</td>
            <td><input type="text" class="form-control" name="passw" id="passw" autocomplete="off" size="30" value="<?php echo $d['passw']?>" required></td>
        </tr> 
        <td><input type="submit" class="btn btn-primary" name="tambah" value="Simpan">
        <input type="button" name="batal" class="btn btn-danger"  value="Batal" onClick="javascript:history.back()"></td>
    </tr>
    </div>
    </table>
    </form>
    <?php
    }
    ?>

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
<i class="fas fa-angle-up"></i>
</a>

<?php include '../design/akhir.php'; ?>