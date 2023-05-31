import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/constants.dart';
import 'package:sample_app/presentation_layer/common/bloc/payment_bloc/payment_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';

import '../../../domain_layer/model/display/cart/cart.model.dart';

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
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            selectedCartList.isNotEmpty
                ? Theme.of(context).primaryColor
                : Colors.grey[400]!,
          ),
        ),
        onPressed: selectedCartList.isNotEmpty
            ? () {
                context.read<PaymentBloc>().add(
                      PayMoney(
                        cartList: selectedCartList,
                        context: context,
                      ),
                    );
              }
            : null,
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocListener<PaymentBloc, PaymentState>(
              child: Text(
                selectedCartList.isNotEmpty
                    ? '${totalPrice.toWon()} 결제하기'
                    : '상품을 선택해주세요',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              listener: (context, state) {
                if (state.status == PaymentStatus.success) {
                  // TODO 결제 완료화면 라우팅
                  // TODO 결제 완료 상품 삭제 -> CartListDeleted 이벤트 상품 리스트 받도록 수정하자, localStorate.removeAll([id1,id2...]
                  // TODO 이것 도 되서 그냥 새로만들지 말고 CartListDeleted이걸 수정하는게 나아보인다
                } else if (state.status == PaymentStatus.error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).highlightColor,
                      behavior: SnackBarBehavior.floating,
                      content: Text(state.message ?? ''),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
