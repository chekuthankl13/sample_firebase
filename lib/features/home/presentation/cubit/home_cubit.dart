
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase/core/usecase/usecase.dart';
import 'package:sample_firebase/features/home/domain/usecases/get_dummy1_data.dart';
import 'package:sample_firebase/features/home/domain/usecases/get_dummy2_data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetDummy1Data getDummy1Data;
  final GetDummy2Data getDummy2Data;
  HomeCubit(this.getDummy1Data, this.getDummy2Data) : super(HomeState.initState());

  fetchDummy1()async{
    try {
      var res =await getDummy1Data.call(NoParam());
      res.fold((l)=>emit(state.copyWith(error1: l.error)), (r)=>emit(state.copyWith(dummy1: r)));
    } catch (e) {
      emit(state.copyWith(error1: e.toString()));
    }
  }


fetchDummy2()async{
    try {
      var res =await getDummy2Data.call(NoParam());
      res.fold((l)=>emit(state.copyWith(error2: l.error)), (r)=>emit(state.copyWith(dummy2: r)));
    } catch (e) {
      emit(state.copyWith(error2: e.toString()));
    }
  }

}
