import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/presentation_layer/cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';

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
        child: BlocBuilder<CartListBloc, CartListState>(
          builder: (context, state) {
            switch (state.status) {
              case CartListStatus.initial:
                return Column(
                  children: _widgetGenerator(7, 'cart_item'),
                );
              case CartListStatus.success:
                return Column(
                    children: state.cartList
                        .map((e) => Container(
                              height: 60,
                              child: Center(
                                child: Text(e.product.title),
                              ),
                            ))
                        .toList());
              case CartListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case CartListStatus.failure:
                return Container(
                  height: 300,
                  child: const Center(
                    child: Text('error'),
                  ),
                );
            }
            // return Column(
            //   children: _widgetGenerator(7, 'cart_item'),
            // );
          },
        ),
      ),
    );
  }
}
