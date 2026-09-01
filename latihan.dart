void main () { // Menampilkan output data yang diberikan
  print("Tugas 1");

  // Menampilkan bilangan ganjil dari 1 sampai 20
  print("Bilangan Ganjil dari 1 sampai 20:"); // Memberikan judul untuk output bilangan ganjil
  for (int i = 1; i <= 20; i++) { // Loop untuk menampilkan bilangan ganjil dari 1 sampai 20
    if (i % 2 != 0) { // Mengecek apakah bilangan i adalah ganjil
      print(i); // Menampilkan bilangan ganjil
    }
  }

  print(""); // Memberikan baris kosong untuk memisahkan output

 print("Tugas 2");
  // Menampilkan karakter * sebanyak 5 kali secara vertikal
  for (int i = 1; i <= 5; i++) { // Loop untuk menampilkan karakter * sebanyak 5 kali
  print("*"); // Menampilkan karakter * pada setiap iterasi
  }

  print("");
  print("pada bintang bisa ada diatas dan dibawahnya"); // Memberikan baris kosong untuk memisahkan output
  print("");

  // atau menampilkan karakter * sebanyak 5 kali secara horizontal
 for (int i = 1; i <= 5; i++) { // Loop untuk menampilkan karakter * sebanyak 5 kali secara horizontal
    String bintang = ""; // Variabel untuk menyimpan karakter * yang akan ditampilkan
    for (int j = 1; j <= i; j++) { // Loop untuk menambahkan karakter * sebanyak i kali
      bintang += "*"; // Menambahkan karakter * ke variabel bintang
    }
    print(bintang); // Menampilkan karakter * pada i sebanyak 5 kali secara horizontal
  }

  print(""); // Memberikan baris kosong untuk memisahkan output

  print("Tugas 3");
  // menampilkan nama berulang sebanyak 4 kali
  for (int i = 1; i <= 4; i++) { // Loop untuk menampilkan nama berulang sebanyak 4 kali
    print("Ridho"); // Menampilkan nama "Ridho" sebanyak 4 kali
  }

  print(""); // Memberikan baris kosong untuk memisahkan output

  print("Tugas 4");

  // Menampilkan perulangan dalam list
  List<String> buah = ["Apel", "Jeruk", "Mangga", "Anggur"]; // List yang berisi nama-nama buah
  print("Daftar Buah:"); // Memberikan judul untuk output daftar buah
  for (String n in buah) { // Loop untuk menampilkan setiap nama buah dalam list
    print("Saya Suka $n"); // Menampilkan nama buah dengan format "Saya Suka [nama buah]"
  }

  print(""); // Memberikan baris kosong untuk memisahkan output

  print("Tugas 5");

  // Menampilkan list daftar belanja menggunakan loop.
  int index = 1; // Variabel untuk menghitung nomor urut item belanja
  List<String> daftarBelanja = ["Beras", "Daging", "Sayur", "Buah"]; // List yang berisi nama-nama item belanja
  print("Daftar Belanja:"); // Memberikan judul untuk output daftar belanja
  for (String item in daftarBelanja) { // Loop untuk menampilkan setiap item belanja dalam list
    print("Item ke-$index: $item"); // Menampilkan nomor urut dan nama item belanja
    index++; // Menambahkan nomor urut untuk item belanja berikutnya
  }
}