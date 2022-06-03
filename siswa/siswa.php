<?php include '../design/awal.php'; ?>
<div class="col-lg-4 p-l-0 title-margin-left">
	<div class="page-header">
		<div class="page-title">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Halaman Data Siswa</a></li>
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

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>No</th>
								<th>ID</th>
								<th>NIS</th>
								<th>Nama</th>
								<th>Action</th>
							</tr>
						</thead>
						 <?php
              //Data mentah yang ditampilkan ke tabel
              include ('../koneksi.php');
              $sql = "SELECT * FROM siswa";

              $hasil = mysqli_query($kon,$sql);
              $no = 1;
              while ($r = mysqli_fetch_array($hasil)) {
            ?>
							<tr align='left'>
							<td><?php echo  $no;?></td>
							<td><?php echo  $r['id']; ?></td>
							<td><?php echo  $r['nis']; ?></td>
							<td><?php echo  $r['name']; ?></td>
							<td>
							<a href="#myModal" class="btn btn-danger" data-toggle="modal">Edit</a> 
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
                        <!-- /# row -->
<!-- modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Masukan Nama Siswa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form action="pedit.php" method="post">
	  
	  <input type="hidden" name="id" value="<?php echo $r['id']?>"/>
      <div class="modal-body">
	 	 	<div class="form-group">
			<label for="nis" class="">NIS :</label>
			<input type="text" id="nis" class="form-control" name="nis" value="<?= $r['nis']; ?>" required autofocus>
		</div>
      <div class="form-group">
			<label for="name" class="">Nama :</label>
			<input type="text" id="name" class="form-control" name="name" value="<?= $r['name']; ?>" required autofocus>
			</div>
     </div>
	  </form>
		<div class="modal-footer">
		<button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>
		<button type="submit" name="tambah" class="btn btn-primary">SUBMIT</button>
      	</div>
	
    </div>
  </div>
</div>
<?php include '../design/akhir.php'; ?>