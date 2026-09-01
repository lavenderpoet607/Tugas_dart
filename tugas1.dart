/* Deklarasi variabel dengan tipe data String untuk menyimpan nama */
late String nama = "Dart";
/* Menyimpan nama toko */
String toko = "TokoViral_";
/* Menyimpan tahun berdiri toko, final berarti nilainya tidak dapat diubah */
final berdiri = 2024;

/* Membuat Map untuk menyimpan nama barang dan harga barang */
Map<String, int> barang = {"Laptop": 8500000,"Mouse": 150000,"Keyboard": 450000};

/* Variabel untuk menghitung nomor urut barang */
int index = 0;

/* Fungsi utama yang akan dijalankan pertama kali */
void main() {
  // TODO : MENAMPILKAN OUTPUT DATA YANG DIBERIKAN
  
  /* Menampilkan judul informasi toko */
  print("=== INFORMASI TOKO ===");
  /* Menampilkan nama toko */
  print("Nama Toko: $toko");
  /* Menampilkan tahun berdiri toko */
  print("Tahun Berdiri: $berdiri");
  /* Menampilkan baris kosong agar output lebih rapi */
  print("");
  /* Menampilkan judul daftar produk */
  print("=== DAFTAR PRODUK ===");

  /* Mengambil setiap data barang dari Map barang */
  barang.entries.forEach((item) {
    /* Menambahkan nomor urut setiap barang */
    index++;
    /* Menampilkan nomor, nama barang, dan harga barang */
    print("$index. ${item.key} - Rp ${item.value}");
  });
}