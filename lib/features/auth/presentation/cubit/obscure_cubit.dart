import 'package:flutter_bloc/flutter_bloc.dart';

class ObscureCubit extends Cubit<int> {
  ObscureCubit() : super(0);

  update(int val)=>emit(val);
}