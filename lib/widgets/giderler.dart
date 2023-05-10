import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hess_app/widgets/gider_listesi/gider_listesi.dart';
import 'package:hess_app/models/gider.dart';
import 'package:hess_app/widgets/yeni_gider.dart';

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
        kategori: Kategori.calisma),
    gider(
        baslik: 'sinema',
        tutar: 65.0,
        tarih: DateTime.now(),
        kategori: Kategori.eglence),
  ];

  void _acikGiderEkle() {
    showModalBottomSheet(
      isScrollControlled: true, //acilan pencerenin tum ekrani kaplamasi icin
      context: context,
      builder: (ctx) => yeniGider(
          onGiderEkle:
              _giderEkle), //yeniGider girileceginde alttan pencereyi acar
    );
  }

  void _giderEkle(gider giderCek) {
    setState(() {
      _kaydedilenGiderler.add(giderCek);
    });
  }

  void _giderSil(gider giderCek) {
    final giderIndex = _kaydedilenGiderler.indexOf(giderCek);
    setState(() {
      _kaydedilenGiderler.remove(giderCek);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      //geri alma
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('gider silindi'),
        action: SnackBarAction(
            label: 'geri al',
            onPressed: () {
              setState(() {
                _kaydedilenGiderler.insert(giderIndex, giderCek);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget anaMetin = const Center(
      child: Text('Gider bulunamadi, lutfen gider ekleyin...'),
    );

    if (_kaydedilenGiderler.isNotEmpty) {
      anaMetin = giderListesi(
        giderler: _kaydedilenGiderler,
        onGiderSil: _giderSil,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('||HessApp||'),
        actions: [
          IconButton(
            onPressed: _acikGiderEkle,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('grafik gelecek..'),
          Expanded(child: anaMetin),
        ],
      ),
    );
  }
}
