import 'package:flutter/material.dart';

class Destinations {
  static final Destinations navDes = Destinations();
  late List<Widget> icons;
  late List<String> labels;
  late bool ignoreLabels = false;
  int Function()? index;
  Function(int)? onSelected;
  int x = -1, y = -1;
  Destinations() {
    icons = [];
    labels = [];
  }

  void add({required IconButton icon, required String label}) {
    if (labels.length > 7) throw Exception();
    icons.add(icon);
    labels.add(label);
  }

  void selectIndex(int Function() funt) {
    index = funt;
  }

  void selected(Function(int) funt) {
    onSelected = funt;
  }
}
