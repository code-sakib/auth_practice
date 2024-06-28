import 'package:bloc/bloc.dart';

class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);

  //That checks for availability of process
  static bool isBusy = false;
  Future<void> run(Future Function() process) async {
    if (isBusy) return;

    isBusy = !isBusy;
    await process();
    isBusy = !isBusy;
  }
}
