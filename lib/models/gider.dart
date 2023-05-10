import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final duzenleyici = DateFormat.yMd();

const uuid = Uuid();

enum Kategori { yemek, seyehat, eglence, calisma }

const kategoriIcons = {
  Kategori.yemek: Icons.launch,
  Kategori.seyehat: Icons.flight_takeoff,
  Kategori.eglence: Icons.movie,
  Kategori.calisma: Icons.work,
};

class gider {
  gider({
    required this.baslik,
    required this.tutar,
    required this.tarih,
    required this.kategori,
  }) : id = uuid.v4();

  final String id;
  final String baslik;
  final double tutar;
  final DateTime tarih;
  final Kategori kategori;

  String get tarihDuzenleyici {
    return duzenleyici.format(tarih);
  }
}
