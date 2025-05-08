# Weatherify

Aplikasi cuaca modern dan elegan yang dibangun dengan Flutter.

## Preview

Light Mode
<img width="321" alt="image" src="https://github.com/user-attachments/assets/5b93d13a-4b83-41c0-9ee5-8a7c2263b0d4" />

Dark Mode
<img width="319" alt="image" src="https://github.com/user-attachments/assets/baa86ea9-3fa2-4b66-b92b-c310401fd7f0" />


## Fitur Unggulan

- 🌤️ **Cuaca Saat Ini**: Tampilkan cuaca terkini dengan animasi dan ikon dinamis.
- 🕒 **Prakiraan Per Jam**: Lihat prakiraan cuaca 12 jam ke depan dalam bentuk carousel interaktif.
- 📅 **Prakiraan 7 Hari**: Tampilkan prakiraan cuaca harian lengkap dengan ikon dan suhu minimum/maksimum.
- 📊 **Info Detail**: Kelembapan, kecepatan angin, tekanan udara, UV index, dan waktu matahari terbit.
- 🌙 **Tema Gelap & Terang**: Otomatis menyesuaikan dengan preferensi sistem, atau bisa diubah manual.
- 📱 **UI Responsif**: Tampilan tetap indah di berbagai ukuran layar, dari ponsel kecil hingga tablet.
- 🚀 **Animasi Halus**: Transisi antar halaman dan komponen dengan animasi modern.
- 📍 **Lokasi Otomatis**: Deteksi lokasi pengguna secara otomatis untuk menampilkan cuaca lokal.

## Persyaratan

- Flutter SDK (versi terbaru)
- Dart SDK (versi terbaru)
- Android Studio / VS Code
- Perangkat Android/iOS atau emulator

## Instalasi

1. Clone repository ini:
```bash
git clone https://github.com/wildanniam/weathery_app
```

2. Masuk ke direktori proyek:
```bash
cd weathery_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Jalankan aplikasi:
```bash
flutter run
```

## Struktur Proyek

```
lib/
  ├── core/
  │   ├── network/
  │   │   └── api_service.dart
  │   ├── providers/
  │   │   └── weather_provider.dart
  │   └── utils/
  │       ├── location_helper.dart
  │       └── weather_icon_helper.dart
  ├── models/
  │   └── weather_model.dart
  ├── screens/
  │   ├── home_screen.dart
  │   └── splash_screen.dart
  ├── widgets/
  │   ├── current_weather_card.dart
  │   ├── daily_forecast_list.dart
  │   ├── hourly_forecast_carousel.dart
  │   ├── weather_app_bar.dart
  │   └── weather_info_mini_cards.dart
  └── main.dart
```

## Cara Penggunaan

1. Buka aplikasi Weatherify.
2. Izinkan akses lokasi saat diminta.
3. Aplikasi akan otomatis menampilkan cuaca di lokasi Anda.
4. Swipe ke bawah untuk melihat prakiraan per jam dan harian.
5. Gunakan tombol refresh di AppBar untuk memperbarui data.
6. Ganti tema gelap/terang melalui ikon di AppBar.

## API yang Digunakan

Aplikasi ini menggunakan [Open-Meteo API](https://open-meteo.com/) untuk data cuaca real-time dan prakiraan.

## Kontribusi

Kontribusi sangat terbuka! Silakan fork repo ini, buat branch baru, dan ajukan pull request.

## Lisensi

MIT License
