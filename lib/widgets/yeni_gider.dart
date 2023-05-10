//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class yeniGider extends StatefulWidget {
  const yeniGider({super.key});

  @override
  State<yeniGider> createState() {
    return _yeniGiderState();
  }
}

class _yeniGiderState extends State<yeniGider> {
  final _baslikKontrolcu = TextEditingController();
  final _fiyatKontrolcu = TextEditingController();

  void _tarihSecici() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
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
      padding: const EdgeInsets.all(17),
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
                    const Text('Tarih Sec'),
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
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); //wigdetimizin ana build'indaki contexet kismina aktararak ilk kisma doner
                },
                child: const Text(
                  'Geri',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_baslikKontrolcu.text);
                  print(_fiyatKontrolcu.text);
                  //kod_blogu:101
                  //print(_girilenBaslik);
                },
                child: const Text('Yeni Degeri Kaydet'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
