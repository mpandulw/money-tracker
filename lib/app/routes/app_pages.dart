import 'package:get/get.dart';

import '../modules/akun/bindings/akun_binding.dart';
import '../modules/akun/views/akun_view.dart';
import '../modules/edit-akun/bindings/edit_akun_binding.dart';
import '../modules/edit-akun/views/edit_akun_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pengaturan/bindings/pengaturan_binding.dart';
import '../modules/pengaturan/views/pengaturan_view.dart';
import '../modules/riwayat/bindings/riwayat_binding.dart';
import '../modules/riwayat/views/riwayat_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/tambah-akun/bindings/tambah_akun_binding.dart';
import '../modules/tambah-akun/views/tambah_akun_view.dart';
import '../modules/tambah-transaksi/bindings/tambah_transaksi_binding.dart';
import '../modules/tambah-transaksi/views/tambah_transaksi_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN,
      page: () => const PengaturanView(),
      binding: PengaturanBinding(),
    ),
    GetPage(
      name: _Paths.RIWAYAT,
      page: () => const RiwayatView(),
      binding: RiwayatBinding(),
    ),
    GetPage(
      name: _Paths.AKUN,
      page: () => const AkunView(),
      binding: AkunBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TRANSAKSI,
      page: () => const TambahTransaksiView(),
      binding: TambahTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_AKUN,
      page: () => const TambahAkunView(),
      binding: TambahAkunBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_AKUN,
      page: () => const EditAkunView(),
      binding: EditAkunBinding(),
    ),
  ];
}
