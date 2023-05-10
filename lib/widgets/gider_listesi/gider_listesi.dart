import 'package:flutter/material.dart';
import 'package:hess_app/widgets/gider_listesi/gider_item.dart';

import 'package:hess_app/widgets/giderler.dart';
import 'package:hess_app/models/gider.dart';

class giderListesi extends StatelessWidget {
  const giderListesi({
    super.key,
    required this.giderler,
    required this.onGiderSil,
  });

  final List<gider> giderler;
  final void Function(gider giderCek) onGiderSil;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: giderler.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(giderler[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.1),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          child: const Align(
            alignment: Alignment.centerRight,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            child: Icon(
              Icons.delete,
              size: 40,
              color: Colors.white,
              //row ekle sagina cop kutusu sola kayacak
            ),
          ),
        ),
        onDismissed: ((direction) {
          onGiderSil(
            giderler[index],
          );
        }),
        child: giderItem(giderler[index]),
      ),
    );
  }
}
