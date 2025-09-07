// Program Dart untuk mencari nilai biner

import 'dart:io';

// Fungsi untuk mencari biner dengan built in method toRoadString dari Dart
String binary(int n){
  if (n < 0) {
    throw ArgumentError('Input tidak boleh bilangan negatif.');
  }
  return n.toRadixString(2);
}

void main(){
  stdout.write("Masukkan sebuah bilangan bulat (n >= 0): ");

  try {
    String? input = stdin.readLineSync();
    // Error handling : Input kosong
    if (input == null || input.isEmpty) {
      print("Error: TIdak ada input yang diberikan.");
      return;
    }

    int angka = int.parse(input);

    // Memanggil fungsi biner
    String hasilBiner = binary(angka);

    print("Bentuk biner dari $angka adalah: $hasilBiner");
  } on FormatException {
    print("Error: Input harus berupa bilangan bulat.");
  } on ArgumentError catch (e) {
    print("Error: ${e.message}");
  } catch (e) {
    print("Terjadi kesalahan: $e");
  }
}