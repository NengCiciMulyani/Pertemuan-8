<?php
include("config.php");
?>
<html lang="en">
<thead>
    <title>Jadwal Perkuliahan</title>
</thead>
<h3>Input Jadwal
    Perkuliahan</h3>
<nav><a href="perkuliahan.php">+ Tambah Baru</a></nav><br>

<body>
    <table border="1">
        <thead>
            <tr>
                <th>NIM</th>
                <th>Nama</TH>
                <th>jurusan</th>
                <th>Nama Dosen</TH>
                <th>Nama Ruangan</TH>
                <th>Hari</th>
                <th>Tanggal</th>
                <th>Edit Jadwal</th>
            </tr>
        </thead>
        <Tbody>
            <?php
            $sql = "select * from report_jadwal";
            $querymhs = mysqli_query($id, $sql);
            while ($registrasi = mysqli_fetch_array($querymhs)) {
            ?>
                <tr>
                    <td><?= $registrasi['idmhs'] ?></td>
                    <td><?= $registrasi['Nama_Mahasiswa'] ?></td>
                    <td><?= $registrasi['nama_jurusan'] ?></td>
                    <td><?= $registrasi['Nama_dosen'] ?></td>
                    <td><?= $registrasi['Nama_Ruangan'] ?></td>
                    <td><?= $registrasi['hari'] ?></td>
                    <td><?= $registrasi['tanggal'] ?></td>
                    <td><a href="editjadwal.php?nim=<?= $registrasi['idmhs'] ?>">Edit</a></td>
                </tr>
            <?php }
            ?>
        </Tbody>
    </table>
    <p>Total Registrasi Mahasiswa : <?php echo
                                    mysqli_num_rows($querymhs) ?></P>
</body>

</html>