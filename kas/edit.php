<?php include '../design/awal.php'; ?>
<div class="container-fluid">

<!-- Breadcrumbs-->
<ol class="breadcrumb">
  <li class="breadcrumb-item active">Halaman Tagihan Kas</li>
</ol>
<div class="row">
  <div class="col-lg-6">
    <div class="card mb-4">
      <div class="card-body">
      <?php
	include '../koneksi.php';
	$id = $_GET['id'];
	$r = mysqli_query($kon,"select * from kas where id='$id'");
    while($d = mysqli_fetch_array($r)){
		?>
        <form action="pedit.php" method="post">
          <table class="table">
          <div class="col-xl-6 col-lg-5">   
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Kas Tagihan</h6>
    </div>
          
            <input type="hidden" class="form-control" name="id" id="id" autocomplete="off"size="30" readonly>
            <tr>
                <td>NIS</td>
                <td>:</td>
                <td><input type="text" class="form-control" name="nis" id="nis" autocomplete="off"  readonly value="<?php echo $d['nis']?>"></td>
            </tr>
            <tr>
                <td>Bulan</td>
                <td>:</td>
                <td><input type="text" class="form-control" name="quantity" id="quantity" autocomplete="off" readonly required value="<?php echo $d['bulan']?>"></td>
            </tr>

          </table>
      </div>
    </div>
  </div>
  <div class="col-xl-6 col-lg-5">
  <div class="card shadow mb-4">
    <!-- Card Header - Dropdown -->
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
      <h6 class="m-0 font-weight-bold text-primary">Pembayaran</h6>
    </div>
    <!-- Card Body -->
    <div class="card-body">
        <tr>
            <td>Pekan 1</td>
            <td>:</td>
            <td><select name="pekan" class="form-control" id="pekan" value="<?php echo $d['pekan1']?>"></td>
                <option value="0">0</option>
                <option value="5000">5000</option>
                </select>
        </tr>
        <tr>
            <td>Pekan 2</td>
            <td><select name="pekan" class="form-control" id="pekan" value="<?php echo $d['pekan2']?>"></td>
                <option value="0">0</option>
                <option value="5000">5000</option>
                </select></tr>
        <tr>
            <td>Pekan 3</td>
            <td><select name="pekan" class="form-control" id="pekan" value="<?php echo $d['pekan3']?>"></td>
                <option value="0">0</option>
                <option value="5000">5000</option>
                </select></tr>
        <tr>
            <td>Pekan 4</td>
            <td>:</td>
            <td><select name="pekan" class="form-control" id="pekan" value="<?php echo $d['pekan4']?>"></td>
                <option value="0">0</option>
                <option value="5000">5000</option>
                </select></tr>
      </div>
    </div>
  </div>
</div>
</div>
<center><div class="col-xl-3 col-lg-4">
<input type="submit" class="btn btn-primary" name="tambah" value="Tambah">
<input type="button" name="batal" class="btn btn-danger"  value="Batal" onClick="javascript:history.back()">
</div> </center>
<!-- /.container-fluid -->
</form>
  <?php
    }
    ?>

<?php include '../design/akhir.php'; ?>