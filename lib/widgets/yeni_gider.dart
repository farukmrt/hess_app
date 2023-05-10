//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hess_app/models/gider.dart';

class yeniGider extends StatefulWidget {
  const yeniGider({super.key, required this.onGiderEkle});

  final void Function(gider giderCek) onGiderEkle;

  @override
  State<yeniGider> createState() {
    return _yeniGiderState();
  }
}

class _yeniGiderState extends State<yeniGider> {
  final _baslikKontrolcu = TextEditingController();
  final _fiyatKontrolcu = TextEditingController();
  DateTime? _secilenTarih;
  Kategori _secilenKategori = Kategori.yemek;

  void _tarihSecici() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final secilmisTarih = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _secilenTarih = secilmisTarih;
    });
  }

  void _giderVerisiniGonder() {
    final girilenTutar = double.tryParse(_fiyatKontrolcu
        .text); //tryParse eger girilen sayi gecersizse null dondurur
    final tutarGecerliMi = girilenTutar == null || girilenTutar <= 0;
    if (_baslikKontrolcu.text.trim().isEmpty ||
        tutarGecerliMi ||
        _secilenTarih == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Uyari!!'),
          content: const Text('Lutfen girilen degerle dikkat edin'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('tamam'),
            ),
          ],
        ),
      );
      //hata mesajı girilir..
      return;
    }

    widget.onGiderEkle(
      gider(
          baslik: _baslikKontrolcu.text,
          tutar: girilenTutar,
          tarih: _secilenTarih!,
          kategori: _secilenKategori),
    );
    Navigator.pop(context); //acilan pencerenin kapatilmasi icin
  }

  @override //kontrolcu kullildiktan sonra icinin temizlenmesi icin dispose kullanimi sarttir.
  void dispose() {
    _baslikKontrolcu.dispose();
    _fiyatKontrolcu.dispose();
    super.dispose();
  }

  //kod_blogu:101
  //bu yontem kullanilirsa degerler manuel olarak tek tek eklenir, kullanissizdir
  //
  // var _girilenBaslik = '';

  // void _girilenBasligiKaydet(String girdiDeger) {
  //   _girilenBaslik = girdiDeger;
  //}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 48, 17, 17),
      child: Column(
        children: [
          TextField(
            controller: _baslikKontrolcu,
            //kod_blogu:101
            //onChanged: _girilenBasligiKaydet,
            maxLength: 40,
            keyboardType: TextInputType
                .text, //belirtilmesi gerekli degildir standart olarak keyboardType text olarak gelir.
            decoration: const InputDecoration(
              label: Text('Baslik'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _fiyatKontrolcu,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Tutar'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _secilenTarih == null
                          ? 'tarih secin'
                          : duzenleyici.format(_secilenTarih!),
                    ),
                    IconButton(
                      onPressed: _tarihSecici,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              DropdownButton(
                value: _secilenKategori,
                items: Kategori.values
                    .map(
                      (kategori) => DropdownMenuItem(
                        value: kategori,
                        child: Text(
                          kategori.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return; //setState buraya yazilmadi cünkü return her zaman calisacak son koddur eger buraya yazılırsa program kitlenir
                  }
                  setState(
                    () {
                      _secilenKategori = value;
                    },
                  );
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); //wigdetimizin ana build'indaki context kismina aktararak ilk kisma doner
                },
                child: const Text('Geri'),
              ),
              ElevatedButton(
                onPressed: _giderVerisiniGonder,
                child: const Text('Yeni Degeri Kaydet'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
