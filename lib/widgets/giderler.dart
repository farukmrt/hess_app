import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hess_app/widgets/gider_listesi/gider_listesi.dart';
import 'package:hess_app/models/gider.dart';

class giderler extends StatefulWidget {
  const giderler({super.key});

  @override
  State<giderler> createState() {
    return _giderlerDurum();
  }
}

class _giderlerDurum extends State<giderler> {
  final List<gider> _kaydedilenGiderler = [
    gider(
        baslik: 'flutter kursu',
        tutar: 109.90,
        tarih: DateTime.now(),
        kategori: Kategori.iss),
    gider(
        baslik: 'sinema',
        tutar: 65.0,
        tarih: DateTime.now(),
        kategori: Kategori.eglence),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('grafik gelecek..'),
          Expanded(
            child: giderListesi(giderler: _kaydedilenGiderler),
          ),
        ],
      ),
    );
  }
}
