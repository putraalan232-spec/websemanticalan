<?php
/**
 * =====================================================================
 * FILE KONEKSI DATABASE
 * Universitas Semantik - Hosting: InfinityFree
 * =====================================================================
 */

// ----------------------------------------------------------------------
// Konfigurasi Database (dari panel InfinityFree -> MySQL Databases)
// ----------------------------------------------------------------------
$host     = "sql113.infinityfree.com";
$username = "if0_43107549";
$password = "Aabb271204";
$database = "if0_43107549_universitassemantic";
$port     = 3306;

// Matikan mode exception mysqli (PHP 8.1+) agar error query/koneksi
// tidak membuat halaman blank; halaman lain sudah menangani fallback sendiri.
mysqli_report(MYSQLI_REPORT_OFF);

// ----------------------------------------------------------------------
// Membuat koneksi menggunakan MySQLi
// ----------------------------------------------------------------------
$koneksi = @new mysqli($host, $username, $password, $database, $port);

// Jika gagal, jangan hentikan halaman (index/login punya mode fallback).
// Untuk melihat penyebab error saat testing, ubah false -> true.
$DEBUG_KONEKSI = false;
if ($koneksi->connect_errno) {
    if ($DEBUG_KONEKSI) {
        die("Koneksi database gagal: " . $koneksi->connect_error);
    }
} else {
    $koneksi->set_charset("utf8mb4");
}
?>
