import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants.dart';
import '../../../common/utils/extensions.dart';
import '../bloc/payment_bloc/payment_bloc.dart';
import '../../../domain_layer/model/display/cart/cart.model.dart';
import '../../cart_list_page/bloc/cart_list_bloc/cart_list_bloc.dart';

class PaymentButton extends StatelessWidget {
  final List<Cart> selectedCartList;
  final int totalPrice;

  const PaymentButton({
    Key? key,
    required this.selectedCartList,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.horizontalPadding,
      child: TextButton(
        onPressed: selectedCartList.isNotEmpty
            ? () {
                context.read<PaymentBloc>().add(
                      PayMoney(cartList: selectedCartList, context: context),
                    );
              }
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            selectedCartList.isNotEmpty
                ? Theme.of(context).primaryColor
                : Colors.grey[400] ?? Colors.grey,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ),
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocListener<PaymentBloc, PaymentState>(
              listener: (context, state) {
                print(state);
                if (state.status == PaymentStatus.success) {
                  context
                      .read<CartListBloc>()
                      .add(CartListDeleted(productIds: state.productIds ?? []));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('결제가 성공적으로 진행됐습니다.'),
                    backgroundColor: Colors.lightGreen,
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state.status == PaymentStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message ?? ''),
                    backgroundColor: Theme.of(context).highlightColor,
                    behavior: SnackBarBehavior.floating,
                  ));
                } else if (state.status == PaymentStatus.notAuthorized) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('로그인이 필요합니다.'),
                    backgroundColor: Theme.of(context).highlightColor,
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              },
              child: Text(
                selectedCartList.isNotEmpty
                    ? '${totalPrice.toWon()} 결제하기'
                    : '상품을 선택해주세요',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
