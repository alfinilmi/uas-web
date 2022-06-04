<?php include '../design/awal.php'; ?>

<!-- Begin Page Content -->
<div class="container-fluid">
  <!-- Page Heading -->
  <!-- <h1 class="h3 mb-2 text-gray-800">Pembelian Barang</h1>
  <p class="mb-4">Data Pembelian</p> -->
  <!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-body">
            <div class="table-responsive">
                <form action="ppengeluaran.php" method="post">
                    <div class="form-group">
                        <label>Total Bayar</label>
                        <input type="number" class="form-control" name="total" placeholder="Dalam Rupiah" require>
                    </div>
                    <div class="form-group">
                        <label>Tanggal</label>
                        <input type="date" class="form-control" name="tgl" require>
                    </div>
                    </div>
                    <div class="form-group">
                        <label>Keterangan</label>
                        <textarea class="form-control" name="ket" rows="5" require></textarea>
                    </div>
                     <button type="submit" name="tambah" class="btn btn-primary">Lapor</button>
                </form>
            </div>
        </div>
    </div>
</div>
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

<?php include '../design/akhir.php'; ?>