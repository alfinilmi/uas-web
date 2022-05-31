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
	                                        <table class="table table-bordered">
	                                            <thead>
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
                                                        $sql = "select * from kas;";
                                                    } else {
                                                        $bulan = $_POST['month'];  // Storing Selected Value In Variable
                                                        $sql = "select * from kas where bulan= '$bulan' group by id;";
                                                    }
													//Data mentah yang ditampilkan ke tabel
													include ('../koneksi.php');

													$hasil = mysqli_query($kon,$sql);
													$no = 1;
													while ($r = mysqli_fetch_array($hasil)) {
													?>
													<tr align='left'>
													<td><?php echo  $no;?></td>
													<td><?php echo  $r['nis']; ?></td>
													<td><?php echo  $r['bulan']; ?></td>
                                                    <td><?php echo  $r['pekan1']; ?></td>
													<td><?php echo  $r['pekan2']; ?></td>
                                                    <td><?php echo  $r['pekan3']; ?></td>
													<td><?php echo  $r['pekan4']; ?></td>
													<td>
													<a href="edit.php?id=<?php echo  $r['id']; ?>"><i class="fa fa-edit" title="edit" style="color:black"></i> Edit</a>
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
<?php include '../design/akhir.php'; ?>