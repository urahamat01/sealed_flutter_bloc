import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sealed_unions/sealed_unions.dart';

typedef WidgetSealedJoin1<A> = Widget Function(
  Widget Function(A) mapFirst,
);

typedef SealedBlocWidgetBuilder1<S extends Union0<A>, A> = Widget Function(
  BuildContext context,
  WidgetSealedJoin1<A>,
);

class SealedBlocBuilder1<Bloc extends bloc.Bloc<dynamic, State>,
    State extends Union0<A>, A> extends BlocBuilderBase<Bloc, State> {
  final SealedBlocWidgetBuilder1<State, A> builder;

  const SealedBlocBuilder1({
    Key key,
    @required this.builder,
    Bloc bloc,
    BlocBuilderCondition<State> condition,
  })  : assert(builder != null),
        super(key: key, bloc: bloc, condition: condition);

  @override
  Widget build(BuildContext context, State state) =>
      builder(context, state.join);
}