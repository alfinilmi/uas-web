<?php include '../design/awal.php'; ?>

<!-- Begin Page Content -->
<div class="container-fluid">
  <!-- Page Heading -->
  <!-- <h1 class="h3 mb-2 text-gray-800">Pembelian Barang</h1>
  <p class="mb-4">Data Pembelian</p> -->
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Riwayat Pemasukkan Barang</h6>
    </div>
      <div class="card-body">
      <div class="table-responsive">
        <!-- <a href="pbelii.php"><input type="button" class="btn btn-danger btn-sm" value="Tambah Data"></a> -->
        <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
          <thead class="thead-light">
              <tr>
                  <th>No</th>
                  <th>Tanggal</th>
                  <th>Jumlah Kas</th>
                  <th>Keterangan</th>
                  <!-- <th>Action</th> -->
              </tr>
          </thead>
            <?php
              //Data mentah yang ditampilkan ke tabel
              include ('../koneksi.php');
              $sql = "SELECT * FROM pengeluaran";

              $hasil = mysqli_query($kon,$sql);
              $no = 1;
              while ($r = mysqli_fetch_array($hasil)) {
            ?>
              <td><?php echo  $no;?></td>
              <td><?php echo  $r['tanggal']; ?></td>
              <td>Rp.<?php echo number_format($r['total_bayar']); ?>,-</td>
              <td><?php echo  $r['keterangan']; ?></td>
            <?php
              $no++;
              }
            ?>
        </table>
        </div>
      </div>
    </div>
  </div>
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>


<?php include '../design/akhir.php'; ?>
