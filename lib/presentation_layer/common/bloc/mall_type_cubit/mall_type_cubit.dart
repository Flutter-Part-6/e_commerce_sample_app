import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/constants.dart';


part 'mall_type_state.dart';

part 'mall_type_cubit.freezed.dart';

class MallTypeCubit extends Cubit<MallTypeState> {
  MallTypeCubit() : super(MallTypeState(MallType.market));

  void changeMallType(int index) => emit(MallTypeState(MallType.values[index]));
}
