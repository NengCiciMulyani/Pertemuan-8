<?php
include 'config.php';
$nim = $_POST['nim'];
$nama = $_POST['nama'];
$alamat = $_POST['alamat'];
$jurusan = $_POST['jurusan'];
$jns_kelamin = $_POST['jns_kelamin'];
$simpandata = ("update mahasiswa set
nim='$nim',nama='$nama',alamat='$alamat',jurusan='$jurusan',jns_kelamin='$jns_
kelamin' where nim='$nim'");
mysqli_query($id, $simpandata);
if ($simpandata) {
    header('Location:index.html?Sukses');
} else {
    header('Location:index.html?Gagal');
}
