import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:matcher/matcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl3.bold.red600.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add to Cart".text.make(),
            ).wh(150, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              height: 30.0,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.0.heightBox,
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                        .text
                        .textStyle(context.captionStyle)
                        .make(),
                  ],
                ).p64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
