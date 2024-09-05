import 'package:flutter/material.dart';

class AlphaCard extends StatelessWidget {
  const AlphaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(12),
        child: Card.filled(
          child: SizedBox(
              width: 500,
              height: 600,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.water_drop_outlined),
                  )
                ],
              )),
        ));
  }
}
