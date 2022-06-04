<?php include 'design/awal.php'; ?>

<div class="container-fluid">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>
    <!-- <br><br><br>
    <h1 class="h3 mb-0 text-primary-800">Alifta Furqonnada Nugraha</h1>
    <h2 class="h3 mb-0 text-primary-500">RPL 4-A</h2>
    <h3 class="h3 mb-0 text-primary-400">Tugas UTS Konstruksi Perangkat Lunak</h3> -->
    <div class="row">
<div class="col-xl-3 col-md-6 mb-4">
  <div class="card border-left-primary shadow h-100 py-2">
    <div class="card-body">
      <div class="row no-gutters align-items-center">
        <div class="col mr-2">
          <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Saldo Kas</div>
          <div class="h5 mb-0 font-weight-bold text-gray-800">
                <?php 
                  include 'koneksi.php';
                  $query = "SELECT*FROM saldo";
                  $hasil = mysqli_query($kon, $query);
                  $hasilFix = mysqli_fetch_array($hasil);
                  echo "RP.".number_format($hasilFix[0]);
                ?>
          </div>
        </div>
        <div class="col-auto">
          <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="col-xl-3 col-md-6 mb-4">
  <div class="card border-left-success shadow h-100 py-2">
    <div class="card-body">
      <div class="row no-gutters align-items-center">
        <div class="col mr-2">
          <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Jumlah Siswa</div>
          <div class="h5 mb-0 font-weight-bold text-gray-800">
                <?php 
                  include 'koneksi.php';
                  $query = "SELECT COUNT(id) FROM siswa";
                  $hasil = mysqli_query($kon, $query);
                  $hasilFix = mysqli_fetch_array($hasil);
                  echo $hasilFix[0];
                ?>
          </div>
        </div>
        <div class="col-auto">
          <i class="fas fa-user-graduate fa-2x text-gray-300"></i>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Earnings (Monthly) Card Example -->
<div class="col-xl-3 col-md-6 mb-4">
  <div class="card border-left-info shadow h-100 py-2">
    <div class="card-body">
      <div class="row no-gutters align-items-center">
        <div class="col mr-2">
          <div class="text-xs font-weight-bold text-info text-uppercase mb-1">TAGIHAN KAS</div>
          <div class="row no-gutters align-items-center">
            <div class="col-auto">
              <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                RP.5000
              </div>
            </div>
          </div>
        </div>
        <div class="col-auto">
          <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card-body">
  <div class="table-responsive">
      <h2 class="text-info">SISWA YANG RAJIN BAYAR KAS</h2>
      <table class="table table-borderless" id="dataTable" width="100%" cellspacing="0">
        <thead class="thead-light">
          <tr>
            <th>No</th>
            <th>Nama</th>
            <th>Total</th>
            <th>Ranking</th>
          </tr>
        </thead>
            <?php
            //Data mentah yang ditampilkan ke tabel
            include ('koneksi.php');
            $sql = "SELECT * FROM ranking";

            $hasil = mysqli_query($kon,$sql);
            $no = 1;
            while ($r = mysqli_fetch_array($hasil)) {
            ?>
            <tr align='left'>
            <td><?php echo  $no;?></td>
            <td><?php echo  $r['name']; ?></td>
            <td><?php echo  $r['total']; ?></td>
            <td><?php echo  $r['RANKING']; ?></td>
            </tr>
            <?php
            $no++;
            }
          ?>
      </table>
  </div>
</div>

</div>
</div>
<!-- 

list menu
anggota
admin
kas
pembayaran

-->


<?php include 'design/akhir.php'; ?>
