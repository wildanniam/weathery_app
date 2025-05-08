import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationHelper {
  static Future<bool> requestLocationPermission() async {
    // Cek status permission
    var status = await Permission.location.status;

    if (status.isDenied) {
      // Minta permission jika belum diizinkan
      status = await Permission.location.request();
    }

    return status.isGranted;
  }

  static Future<Position> getCurrentPosition() async {
    // Cek apakah GPS aktif
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Layanan lokasi tidak aktif. Mohon aktifkan GPS Anda.');
    }

    // Cek permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(
            'Izin lokasi ditolak. Aplikasi membutuhkan akses lokasi untuk menampilkan informasi cuaca.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Izin lokasi ditolak secara permanen. Mohon aktifkan izin lokasi di pengaturan aplikasi.');
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
    } catch (e) {
      throw Exception('Gagal mendapatkan lokasi: $e');
    }
  }
}
