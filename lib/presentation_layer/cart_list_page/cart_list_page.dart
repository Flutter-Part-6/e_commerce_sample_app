import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/component/app_bar/widget/icon_box.dart';

const List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

List<Widget> _widgetGenerator(int len, String prefix) {
  List<Widget> widgets = [];
  for (int i = 0; i < len; i++) {
    final widget = Container(
      height: 150,
      color: colorList[i],
      child: Center(
          child: Text(
        style: const TextStyle(color: Colors.black, fontSize: 20),
        '${prefix}_$i',
      )),
    );
    widgets.add(widget);
  }
  return widgets;
}

class CartListPage extends StatelessWidget {
  const CartListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconBox(
          icon: Icons.close,
          onPressed: () {
            if (Navigator.canPop(context)) {
              context.pop();
            }
          },
        ),
        title: const Text('장바구니'),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _widgetGenerator(7, 'cart_item'),
        ),
      ),
    );
  }
}
