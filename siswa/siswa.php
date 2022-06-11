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
					<a href="tambah.php"><button type="button" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>Tambah Data</button></a>
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
              while ($d = mysqli_fetch_array($hasil)) {
            ?>
							<tr align='left'>
							<td><?php echo  $no;?></td>
							<td><?php echo  $d['id']; ?></td>
							<td><?php echo  $d['nis']; ?></td>
							<td><?php echo  $d['name']; ?></td>
							<td>
							<a href="edit.php?id=<?php echo  $d['id']; ?>"><i class="fa fa-edit" title="edit" style="color:black"></i>Edit</a>
							<a href="hapus.php?id=<?php echo  $d['id']; ?>"> <i class="fa fa-eraser" title="hapus" style="color:black"></i>Hapus</a>
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

<?php include '../design/akhir.php'; ?>