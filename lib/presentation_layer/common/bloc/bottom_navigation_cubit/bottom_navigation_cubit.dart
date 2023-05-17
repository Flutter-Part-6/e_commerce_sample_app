// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigation { A, B, C, user }

class BottomNavigationCubit extends Cubit<BottomNavigation> {
  BottomNavigationCubit() : super(BottomNavigation.A);

  void changeBottomType(int index) => emit(BottomNavigation.values[index]);
}
