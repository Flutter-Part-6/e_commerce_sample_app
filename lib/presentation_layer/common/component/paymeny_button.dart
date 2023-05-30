import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/common/constants.dart';
import 'package:sample_app/presentation_layer/common/bloc/payment_bloc/payment_bloc.dart';

import '../../../domain_layer/model/display/product_info/product_info.model.dart';

class PaymentButton extends StatelessWidget {
  final List<ProductInfo> productInfoList;

  const PaymentButton({
    Key? key,
    required this.productInfoList,
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
            Theme.of(context).primaryColor,
          ),
        ),
        onPressed: () {
          context.read<PaymentBloc>().add(
                PayMoney(
                  productInfoList: productInfoList,
                  context: context,
                ),
              );
        },
        child: SizedBox(
          height: 50,
          child: Center(
            child: BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                if (state.status == PaymentStatus.loading) {
                  return const CircularProgressIndicator();
                }
                return Text(
                  '결제',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
