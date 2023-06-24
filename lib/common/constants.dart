import 'package:flutter/material.dart';

import '../theme/app_bar_theme.dart';

class Constants {
  static const String targetApiKey = 'TARGET';

  static EdgeInsets get horizontalPadding =>
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets get verticalPadding =>
      const EdgeInsets.symmetric(vertical: 16);
}

// mallType
enum MallType { market, beauty }

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

extension MallTypeX on MallType {
  String get toName {
    switch (this) {
      case MallType.market:
        return '마켓패캠';
      case MallType.beauty:
        return '뷰티패캠';
    }
  }

  CustomAppBarTheme get theme {
    switch (this) {
      case MallType.market:
        return CustomAppBarTheme.market;
      case MallType.beauty:
        return CustomAppBarTheme.beauty;
    }
  }

  get isMarket => this == MallType.market;

  get isBeauty => this == MallType.beauty;
}
