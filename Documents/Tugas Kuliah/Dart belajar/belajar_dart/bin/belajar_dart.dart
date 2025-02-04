class Kendaraan {
  String merk;
  String model;
  int tahun;

  Kendaraan({
    required this.merk,
    required this.model,
    required this.tahun,
  });

  void info() {
    print('Kendaraan: $merk $model, Tahun: $tahun');
  }
}

class Mobil extends Kendaraan {
  int bahanBakar;
  int jumlahKursi;

  Mobil({
    required String merk,
    required String model,
    required int tahun,
    required this.bahanBakar,
    required this.jumlahKursi,
  }) : super(merk: merk, model: model, tahun: tahun);

  void nyalakanAC(int suhu) {
    print('AC dinyalakan pada suhu $suhu°C');
  }
}

class Motor extends Kendaraan {
  int cc;
  String jenisMotor;

  Motor({
    required String merk,
    required String model,
    required int tahun,
    required this.cc,
    required this.jenisMotor,
  }) : super(merk: merk, model: model, tahun: tahun);

  void tambahKecepatan(int kecepatan) {
    print('Kecepatan bertambah $kecepatan km/jam');
  }
}

void main() {
  Mobil mobil = Mobil(
    merk: 'Toyota',
    model: 'Avanza',
    tahun: 2020,
    bahanBakar: 90,
    jumlahKursi: 7,
  );

  mobil.info();
  mobil.nyalakanAC(25);
  Motor motor = Motor(
    merk: 'Honda',
    model: 'Beat',
    tahun: 2022,
    cc: 110,
    jenisMotor: 'Matic',
  );

  motor.info();
  motor.tambahKecepatan(20);
}
