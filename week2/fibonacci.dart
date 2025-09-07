import 'dart:io';

int fibonacci(int n) {
  if(n == 0 || n == 1){
    return n;
  }

  int prev_number = 0;
  int current_number = 1;

  for (int i =2; i <= n; i++){
    int next_number = prev_number + current_number;

    prev_number = current_number;
    current_number = next_number;
  }

  return current_number;
}


void main() {
  stdout.write("Masukkan bilangan bulat positif: ");

  try {
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Error: Tidak ada input yang diberikan.");
      return;
    }

    int n = int.parse(input);

    if (n<0) {
      print("Error: Harap masukkan bilangan bulat positif.");
    } else {
      int hasil = fibonacci(n);

      print("Bilangan Fibonacci ke-$n adalah: $hasil");
    }
  } on FormatException {
    // 3. MENANGKAP ERROR JIKA INPUT BUKAN ANGKA
    print("Error: Input tidak valid. Harap masukkan sebuah angka.");
  } catch (e) {
    // Menangkap error tak terduga lainnya
    print("Terjadi sebuah kesalahan: $e");
  }
}

