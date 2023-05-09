import 'package:flutter/material.dart';
import 'package:hess_app/widgets/gider_listesi/gider_item.dart';

import 'package:hess_app/widgets/giderler.dart';
import 'package:hess_app/models/gider.dart';

class giderListesi extends StatelessWidget {
  const giderListesi({
    super.key,
    required this.giderler,
  });

  final List<gider> giderler;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: giderler.length,
      itemBuilder: (ctx, index) => giderItem(giderler[index]),
    );
  }
}
