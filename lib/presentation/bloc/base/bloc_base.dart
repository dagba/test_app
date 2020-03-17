import 'package:rxdart/rxdart.dart';
import 'package:testapp/presentation/bloc/base/event_base.dart';
import 'package:testapp/presentation/bloc/base/state_base.dart';

abstract class BlocBase<A extends EventBase, B extends StateBase> {
  const BlocBase(this.state);
  void dispatch(A event);
  final BehaviorSubject<B> state;
  void dispose();
}
