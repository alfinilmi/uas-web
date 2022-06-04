<?php include '../design/awal.php'; ?>
<div class="col-lg-4 p-l-0 title-margin-left">
	<div class="page-header">
		<div class="page-title">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Halaman Tagihan Uang  Kas</a></li>
			</ol>
		</div>
	</div>
</div>
<!-- /# column -->
<!-- /row -->

<section id="main-content">
<div class="row">
	<div class="col-lg-12">
		<!-- <div class="card-title">
			<h3 class="color-primary">Data Admin</h3>
		</div> -->
		<div class="card">
			<div class="card-body">

				<form method="post">
					<select name="month" class="form-control mb-4" onchange="this.form.submit()">
						<option value="0">Pilih Bulan...</option>
						<option value="Januari">Januari</option>
						<option value="Februari">Februari</option>
						<option value="Maret">Maret</option>
						<option value="April">April</option>
						<option value="Mei">Mei</option>
						<option value="Juni">Juni</option>
						<option value="Juli">Juli</option>
						<option value="Agustus">Agustus</option>
						<option value="September">September</option>
						<option value="Oktober">Oktober</option>
						<option value="November">November</option>
						<option value="Desember">Desember</option>
					</select>
				</form>

				<div class="table-responsive">
					<table class="table table-borderless" id="dataTable" width="100%" cellspacing="0">
        				<thead class="thead-light">
							<tr>
								<th>No</th>
								<th>Nama</th>
								<th>Bulan</th>
								<th>Pekan 1</th>
								<th>Pekan 2</th>
								<th>Pekan 3</th>
								<th>Pekan 4</th>
								<th>Action</th>
							</tr>
						</thead>
						<?php
							if(!isset($_POST['month'])){
								$sql = "select * from viewkas;";
							} else {
								$bulan = $_POST['month'];  // Storing Selected Value In Variable
								$sql = "select * from viewkas where bulan= '$bulan' group by id;";
							}
							//Data mentah yang ditampilkan ke tabel
							include ('../koneksi.php');

							$hasil = mysqli_query($kon,$sql);
							$no = 1;
							while ($r = mysqli_fetch_array($hasil)) {
							?>
							<tr align='left'>
							<td><?php echo  $no;?></td>
							<td><?php echo  $r['name']; ?></td>
							<td><?php echo  $r['bulan']; ?></td>
							<td>RP.<?php echo  number_format($r['pekan1']); ?></td>
							<td>RP.<?php echo  number_format($r['pekan2']); ?></td>
							<td>RP.<?php echo  number_format($r['pekan3']); ?></td>
							<td>RP.<?php echo  number_format($r['pekan4']); ?></td>
							<td>
							<a href="edit.php?id=<?php echo  $r['id']; ?>"><i class="fa fa-edit" title="edit" style="color:black"></i>Edit</a>
							<!-- <a href="#myModal" class="btn btn-danger" data-toggle="modal">Edit</a>  -->
							</td>
							</tr>
							<?php
							$no++;
							}
						?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /# column -->
</div>
                        <!-- /# row
modal -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Masukan Saldo Kas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="pedit.php" method="post">
	  
	  <input type="hidden" name="id" value="<?php echo $d['id']?>"/>
      <div class="modal-body">
	 	 <div class="form-group">
			<label for="nis" class="">NIS :</label>
			<input type="text" id="nis" class="form-control" name="nis" value="<?= $d['nis']; ?>" required autofocus>
		</div>
        <div class="form-group">
			<label for="bulan" class="">Bulan :</label>
			<input type="text" id="bulan" class="form-control" name="bulan" value="<?= $d['bulan']; ?>" required autofocus>
		</div>
		<div class="form-group">
			<label for="pekan1" class="">Pekan 1 :</label>
			<input type="text" id="pekan1" class="form-control" name="pekan1" value="<?= $d['pekan1']; ?>" required autofocus>
		</div>
		<div class="form-group">
			<label for="pekan2" class="">Pekan 2 :</label>
			<input type="text" id="pekan2" class="form-control" name="pekan2" value="<?= $d['pekan2']; ?>" required autofocus>
		</div>
        <div class="form-group">
			<label for="pekan3" class="">Pekan 3 :</label>
			<input type="text" id="pekan3" class="form-control" name="pekan3" value="<?= $d['pekan3']; ?>" required autofocus>
		</div>
		<div class="form-group">
			<label for="pekan4" class="">Pekan 4 :</label>
			<input type="text" id="pekan4" class="form-control" name="pekan4" value="<?= $d['pekan4']; ?>" required autofocus>
		</div>
      </div>
	  </form>
		<div class="modal-footer">
		<button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<button type="submit" name="tambah" class="btn btn-primary">SUBMIT</button>
      	</div>
	
    </div>
  </div>
</div> -->
<?php include '../design/akhir.php'; ?>