// Program Dart untuk mencari nilai faktorial

import 'dart:io';

int factorial (int n){
  if (n < 0) {
    throw ArgumentError('Faktorial tidak terdefinisi untuk bilangan negatif.');
  } 
  // Base case untuk menghentikan rekursi.
  else if (n == 0) {
    return 1;
  } 
  else {
    return n * factorial(n-1);
  }
}

void main() {
  stdout.write("Masukkan sebuah bilangan bulat: ");

  try {
    String? input = stdin.readLineSync();

    // Error handling : Input kosong
    if (input == null || input.isEmpty) {
      print("Error: Tidak ada input yang diberikan.");
      return;
    }

    int angka = int.parse(input);
    int hasil = factorial(angka);

    print("Faktorial dari $angka adalah $hasil");

  } on FormatException {
    print("Error: Input harus berupa bilangan bulat.");
  } on ArgumentError catch (e) {
    print("Error: ${e.message}");
  } catch (e) {
    // Menangkap error jika terjadi integer overflow
    print("Terjadi error: $e. Angka yang Anda masukkan mungkin terlalu besar untuk tipe data 'int'.");
  }
}

  