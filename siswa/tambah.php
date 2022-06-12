<?php include '../design/awal.php'; ?>
<div class="container-fluid">

<!-- Breadcrumbs-->
<ol class="breadcrumb">
  <li class="breadcrumb-item active">Halaman Daftar Siswa</li>
</ol>
<div class="row">
  <div class="col-lg-6">
    <div class="card mb-4">
      <div class="card-body">
          <form action="ptambah.php" method="post">
          <table class="table">
          <div class="col-xl-6 col-lg-5">   
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Data Siswa</h6>
    </div>
            <tr>
                <td>ID</td>
                <td>:</td>
                <td><input type="hidden" name="id" value="<?php echo $d['id']?>"/></td>
            </tr>
            <tr>
                <td>NIS</td>
                <td>:</td>
                <td><input type="text" class="form-control" name="nis" id="nis" autocomplete="off" required></td>
            </tr>
            <tr>
                <td>Nama</td>
                <td>:</td>
                <td><input type="text" class="form-control" name="name" id="name" autocomplete="off" required></td>
            </tr>

          </table>
      </div>
    </div>
  </div>
</div>
<center><div class="col-xl-3 col-lg-4">
<input type="submit" class="btn btn-primary" name="tambah" value="Tambah">
<input type="button" name="batal" class="btn btn-danger"  value="Batal" onClick="javascript:history.back()">
</div> </center>

</form>
<?php include '../design/akhir.php'; ?>