// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigation { home, category, search, user }

class BottomNavigationCubit extends Cubit<BottomNavigation> {
  BottomNavigationCubit() : super(BottomNavigation.home);

  void changeBottomType(int index) => emit(BottomNavigation.values[index]);
}
