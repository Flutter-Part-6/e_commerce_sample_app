import 'package:flutter/material.dart';

class Constants {
  static EdgeInsets get horizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets get verticalPadding =>
      const EdgeInsets.symmetric(vertical: 16);
}

// storeType
enum StoreType { market, beauty }

//bloc status
enum Status { initial, loading, success, error }

enum DataSource {
  REMOTE,
  MOCK,
}

extension StatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}

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
