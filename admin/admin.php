<?php include '../design/awal.php'; ?>
						<div class="col-lg-4 p-l-0 title-margin-left">
	                        <div class="page-header">
	                            <div class="page-title">
	                                <ol class="breadcrumb">
	                                    <li class="breadcrumb-item"><a href="#">Halaman Admin</a></li>
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
	                                    	<!-- <a href="#"><button type="button" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5"><i class="ti-plus"></i>Tambah Data</button></a> -->
	                                        <table class="table table-bordered">
	                                            <thead>
	                                                <tr>
	                                                    <th>No</th>
														<th>Id</th>
														<th>Username</th>
	                                                    <th>Password</th>
														<th>Action</th>
	                                                </tr>
	                                            </thead>
												<?php
													//Data mentah yang ditampilkan ke tabel
													include ('../koneksi.php');
													$sql = "SELECT * FROM admin";

													$hasil = mysqli_query($kon,$sql);
													$no = 1;
													while ($r = mysqli_fetch_array($hasil)) {
													?>
													<tr align='left'>
													<td><?php echo  $no;?></td>
													<td><?php echo  $r['id']; ?></td>
													<td><?php echo  $r['uname']; ?></td>
													<td><?php echo  $r['passw']; ?></td>
													<td>
													<a href="edit.php?id=<?php echo  $r['id']; ?>"><i class="fa fa-edit" title="edit" style="color:black"></i></a> |
													<a href="hapus.php?id=<?php echo  $r['id']; ?>"> <i class="fa fa-eraser" title="hapus" style="color:black"></i></a>   
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