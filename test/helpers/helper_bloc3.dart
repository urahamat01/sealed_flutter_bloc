import 'package:bloc/bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

enum HelperEvent3 { event2, event3 }

class HelperState3 extends Union3Impl<State1, State2, State3> {
  HelperState3._(Union3<State1, State2, State3> union) : super(union);

  factory HelperState3.first() => HelperState3._(unions.first(State1()));

  factory HelperState3.second() => HelperState3._(unions.second(State2()));

  factory HelperState3.third() => HelperState3._(unions.third(State3()));

  static final Triplet<State1, State2, State3> unions =
      const Triplet<State1, State2, State3>();
}

class State1 {}

class State2 {}

class State3 {}

class HelperBloc3 extends Bloc<HelperEvent3, HelperState3> {
  HelperBloc3() : super(HelperState3.first()) {
    on<HelperEvent3>((event, emit) {
      switch (event) {
        case HelperEvent3.event2:
          return emit(HelperState3.second());
        case HelperEvent3.event3:
          return emit(HelperState3.third());
      }
    });
  }
}
