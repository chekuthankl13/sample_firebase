part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Stream<List<Map<String, dynamic>>> dummy1;
  final Stream<List<Map<String, dynamic>>> dummy2;
  final String error1;
  final String error2;

  const HomeState(
      {required this.dummy1,
      required this.dummy2,
      required this.error1,
      required this.error2});

  @override
  List<Object> get props => [dummy1, dummy2, error1, error2];

  factory HomeState.initState() => const HomeState(
      dummy1: Stream<List<Map<String, dynamic>>>.empty(),
      dummy2: Stream<List<Map<String, dynamic>>>.empty(),
      error1: "",
      error2: "");

  HomeState copyWith({dummy1, dummy2, error1, error2}) => HomeState(
      dummy1: dummy1 ?? this.dummy1,
      dummy2: dummy2 ?? this.dummy2,
      error1: error1 ?? this.error1,
      error2: error2 ?? this.error2);
}
