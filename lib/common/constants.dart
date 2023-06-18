import 'package:flutter/material.dart';

class Constants {
  static EdgeInsets get horizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets get verticalPadding =>
      const EdgeInsets.symmetric(vertical: 16);
}

//TODO 스토어타입 위치 확인 해야 됌
// storeType
enum StoreType { market, beauty }

extension StoreTypeX on StoreType {
  String get toName {
    switch (this) {
      case StoreType.market:
        return '마켓다트';
      case StoreType.beauty:
        return '뷰티다트';
    }
  }

  get isMarket => this == StoreType.market;

  get isBeauty => this == StoreType.beauty;
}

enum DataSource {
  REMOTE,
  MOCK,
}
