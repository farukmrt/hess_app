import 'package:flutter/material.dart';

import 'package:hess_app/models/gider.dart';

class giderItem extends StatelessWidget {
  const giderItem(this.giderCek, {super.key});

  final gider giderCek;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
          vertical: 13,
        ),
        child: Column(
          children: [
            Text(giderCek.baslik),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${giderCek.tutar.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(kategoriIcons[giderCek.kategori]),
                    const SizedBox(width: 8),
                    Text(giderCek.tarihDuzenleyici),
                  ],
                ),
                //Row(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
