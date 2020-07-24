-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 24 Jul 2020 pada 11.56
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_aset`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_aset`
--

CREATE TABLE `tb_jenis_aset` (
  `id` int(11) NOT NULL,
  `kode_jenis` text NOT NULL,
  `nama_jenis` text NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jenis_aset`
--

INSERT INTO `tb_jenis_aset` (`id`, `kode_jenis`, `nama_jenis`, `jumlah`) VALUES
(1, 'M.TK', 'Meja  TK', 15),
(2, 'K.TK', 'Kursi TK', 30),
(3, 'M', 'Meja SD-SMA', 1),
(4, 'K', 'Kursi SD-SMA', 9),
(5, 'PTB', 'Papan Tulis Besar', 1),
(6, 'PTK', 'Papan Tulis Kecil', 1),
(7, 'I', 'Infocus', 1),
(8, 'RG', 'Rak Gantung', 1),
(9, 'SP', 'Speaker', 1),
(10, 'KA.', 'Kipas Angin', 1),
(11, 'PC.', 'PC', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nama_aset`
--

CREATE TABLE `tb_nama_aset` (
  `id` int(11) NOT NULL,
  `kode_aset` varchar(255) NOT NULL,
  `nama_aset` text NOT NULL,
  `tahun_perolehan` int(11) NOT NULL,
  `harga_perolehan` int(11) NOT NULL,
  `nilai_residu` int(11) NOT NULL,
  `umur_ekonomis` int(11) NOT NULL,
  `lokasi` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `id_jenis_aset` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `vendor` text NOT NULL,
  `tanggal_pembelian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_nama_aset`
--

INSERT INTO `tb_nama_aset` (`id`, `kode_aset`, `nama_aset`, `tahun_perolehan`, `harga_perolehan`, `nilai_residu`, `umur_ekonomis`, `lokasi`, `jumlah`, `id_jenis_aset`, `status`, `vendor`, `tanggal_pembelian`) VALUES
(1, '111111', 'Meja Teka', 2016, 0, 5000, 4, 'Ruang Kelas', 0, 1, 'Diajukan', 'A', '0000-00-00'),
(3, 'Kwdhdhb', 'Payung', 2019, 9000, 200, 4, 'Bnaudng', 1, 1, 'Diajukan', 'A', '0000-00-00'),
(4, '88', 'Meja Gue', 2020, 2929, 2, 1, 'nsn', 1, 1, 'Diajukan', 'A', '0000-00-00'),
(5, 'KT.29922992', 'Kursi TK', 2012, 800000, 10000, 4, 'Ruang Kelas', 20, 2, 'Diajukan', 'A', '0000-00-00'),
(6, '7787', '88878', 2020, 90000000, 100000, 3, 'RUang TU', 9, 2, 'Diajukan', 'A', '0000-00-00'),
(7, '09393939', 'Kursi SD-SMA BPI 1', 2018, 9000000, 8000, 4, 'Ruang TU', 8, 4, 'Diterima', 'AB', '2020-12-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `id` int(11) NOT NULL,
  `id_aset` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`id`, `id_aset`, `tanggal_pinjam`, `lama_pinjam`, `status`, `jumlah_pinjam`, `id_user`) VALUES
(1, 1, '1222-02-22', 1, 'pengajuan', 2, 4),
(2, 1, '2222-02-12', 1, 'Dikabulkan', 2, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penghapusan`
--

CREATE TABLE `tb_penghapusan` (
  `id` int(11) NOT NULL,
  `id_aset` int(11) NOT NULL,
  `nilai_penghapusan` float NOT NULL,
  `hasil_penghapusan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penghapusan`
--

INSERT INTO `tb_penghapusan` (`id`, `id_aset`, `nilai_penghapusan`, `hasil_penghapusan`) VALUES
(1, 1, 1, 'dilelah / dijual');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penyusutan`
--

CREATE TABLE `tb_penyusutan` (
  `id` int(11) NOT NULL,
  `id_aset` int(11) NOT NULL,
  `nilai_penyusutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_penyusutan`
--

INSERT INTO `tb_penyusutan` (`id`, `id_aset`, `nilai_penyusutan`) VALUES
(1, 1, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'sekretariat', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(2, 'pembina', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(5, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 3),
(6, 'sekolah', '81dc9bdb52d04dc20036dbd8313ed055', 4);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_jenis_aset`
--
ALTER TABLE `tb_jenis_aset`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_nama_aset`
--
ALTER TABLE `tb_nama_aset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jenis_aset` (`id_jenis_aset`);

--
-- Indeks untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penghapusan`
--
ALTER TABLE `tb_penghapusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penyusutan`
--
ALTER TABLE `tb_penyusutan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_jenis_aset`
--
ALTER TABLE `tb_jenis_aset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_nama_aset`
--
ALTER TABLE `tb_nama_aset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_penghapusan`
--
ALTER TABLE `tb_penghapusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_penyusutan`
--
ALTER TABLE `tb_penyusutan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_nama_aset`
--
ALTER TABLE `tb_nama_aset`
  ADD CONSTRAINT `tb_nama_aset_ibfk_1` FOREIGN KEY (`id_jenis_aset`) REFERENCES `tb_jenis_aset` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
