# Weatherify

Aplikasi cuaca modern dan elegan yang dibangun dengan Flutter.

## Fitur

- Tampilan cuaca saat ini dengan animasi yang menarik
- Prakiraan cuaca per jam untuk 12 jam ke depan
- Prakiraan cuaca harian untuk 7 hari ke depan
- Informasi cuaca detail (kelembaban, kecepatan angin, dll)
- Tema gelap dan terang
- Lokalisasi otomatis
- Animasi transisi yang halus
- UI yang responsif untuk berbagai ukuran layar

## Persyaratan

- Flutter SDK (versi terbaru)
- Dart SDK (versi terbaru)
- Android Studio / VS Code
- Perangkat Android/iOS atau emulator

## Instalasi

1. Clone repository ini:
```bash
git clone https://github.com/username/weathery_app.git
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

## Penggunaan

1. Buka aplikasi
2. Izinkan akses lokasi saat diminta
3. Aplikasi akan menampilkan informasi cuaca untuk lokasi Anda
4. Gunakan tombol refresh di AppBar untuk memperbarui data
5. Geser ke bawah untuk melihat prakiraan cuaca per jam
6. Geser ke bawah lagi untuk melihat prakiraan cuaca harian

## API yang Digunakan

Aplikasi ini menggunakan [Open-Meteo API](https://open-meteo.com/) untuk data cuaca.

## Lisensi

MIT License
