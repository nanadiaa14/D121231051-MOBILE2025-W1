# Program untuk Menghitung Nilai Faktorial

def hitung_faktorial(n):
    if n < 0:
        return "Tidak dapat menghitung nilai faktorial untuk bilangan negatif"
    elif n == 0:
        return 1
    else:
        return n + hitung_faktorial(n-1)
    
angka = int(input("Masukkan sebuah bilangan bulat : "))

print(f"Faktorial dari {angka} adalah {hitung_faktorial(angka)}")
    
