import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:bootpay/bootpay.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/user.dart' as payUser;

import '../user_bloc/user_bloc.dart';

part 'payment_event.dart';

part 'payment_state.dart';

part 'payment_bloc.freezed.dart';

enum PaymentStatus { initial, success, error, notAuthorized }

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState()) {
    on<PayMoney>(_onPayMoney);
  }

  Future<void> _onPayMoney(
    PayMoney event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.initial));

    final user = event.context.read<UserBloc>().state.user;
    if (user == null) {
      emit(
        state.copyWith(
          status: PaymentStatus.notAuthorized,
        ),
      );

      return;
    }

    Payload payload = _getPayload(event.cartList, user);

    (bool, String?) response = await _bootPay(
      event.context,
      payload,
    );

    if (response.$1) {
      emit(
        state.copyWith(
          status: PaymentStatus.success,
          productIds:
              event.cartList.map((cart) => cart.product.productId).toList(),
        ),
      );
    } else {
      var message = '결제가 실패했습니다. 잠시후 다시 시도해주세요';
      if (response.$2 != null) {
        var decoded = jsonDecode(response.$2 ?? '');
        message = decoded['message'] ?? message;
      }
      emit(state.copyWith(status: PaymentStatus.error, message: message));
    }
  }
}

Future<(bool, String?)> _bootPay(BuildContext context, Payload payload) async {
  final Completer<(bool, String?)> completer = Completer();

  if (kIsWeb) {
    payload.extra?.openType = "iframe";
  }

  (bool, String?) response = (false, '');

  Bootpay().requestPayment(
    context: context,
    payload: payload,
    showCloseButton: false,
    onCancel: (String data) {
      response = (false, data);
    },
    onError: (String data) {
      Bootpay().dismiss(context);
      response = (false, data);
    },
    onClose: () {
      Bootpay().dismiss(context);
      completer.complete(response);
    },
    onConfirm: (String data) {
      return true;
    },
    onDone: (String data) {
      response = (true, data);
    },
  );

  return completer.future;
}

Payload _getPayload(List<Cart> cartList, User? loginUser) {
  Payload payload = Payload();
  var totalPrice = 0.0;

  List<Item> itemList = cartList.map((cart) {
    Item item = Item();
    item.name = cart.product.title;
    item.qty = cart.quantity;
    item.id = cart.product.productId;
    item.price = cart.product.price.toDouble();

    totalPrice += (cart.product.price * cart.quantity).toDouble();

    return item;
  }).toList();

  payload.androidApplicationId = "64566178755e27001b376047";
  payload.iosApplicationId = "64566178755e27001b376048"; // ios application id

  payload.pg = "kcp";
  payload.orderName = cartList.length > 1
      ? '${cartList.first.product.title} 외 ${cartList.length - 1}건'
      : cartList.first.product.title;

  payload.price = totalPrice;

  payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();

  payload.items = itemList; // 상품정보 배열

  payUser.User user = payUser.User();
  user.id = loginUser?.id.toString();
  user.username = loginUser?.kakaoAccount?.profile?.nickname;
  user.email = loginUser?.kakaoAccount?.email;

  Extra extra = Extra(); // 결제 옵션
  extra.appScheme = 'com.example.sampleApp';

  payload.user = user;
  payload.extra = extra;

  return payload;
}
