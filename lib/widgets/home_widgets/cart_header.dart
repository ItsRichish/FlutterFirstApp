import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Ekart App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
