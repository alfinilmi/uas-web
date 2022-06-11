<?php
session_start();
if(isset($_SESSION['uname'])) {
    header('location: utama.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>
  <link rel="icon" type="image/x-icon" href="/uas-web/assets/icon.png">

  <!-- Custom fonts for this template-->
  <link href="/uas-web/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="/uas-web/assets/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="/uas-web/assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-8 col-lg-6 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
              <div class="col-lg-12">
                <div class="p-5">
                  <img src="/uas-web/assets/icon.png" class="mx-auto d-block mb-4" width="100">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">TAGIHAN KAS</h1>
                  </div>

                  <form class="user" action="proses.php" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" placeholder="Masukan Username ..." name="uname" required>
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" placeholder="Masukan Password ..." name="passw" required>
                    </div>
                    <button class="btn btn-dark btn-user btn-block">Login</button>

                  </form>
                  <!-- <hr> -->
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

<!-- Bootstrap core JavaScript-->
<script src="/uas-web/assets/vendor/jquery/jquery.min.js"></script>
<script src="/uas-web/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="/uas-web/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="/uas-web/assets/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="/uas-web/assets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/uas-web/assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="/uas-web/assets/vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="/uas-web/assets/js/demo/chart-area-demo.js"></script>
<script src="/uas-web/assets/js/demo/chart-pie-demo.js"></script>
<script src="/uas-web/assets/js/demo/datatables-demo.js"></script>


</body>

</html>
