import 'dart:async';
import 'dart:developer';

import 'package:able/able.dart';
import 'package:bloc/bloc.dart';
import 'package:havayot/data/services/no_connection_exception.dart';
import 'package:havayot/main.dart';
import 'package:rxdart/rxdart.dart';

class HvCubit<State> extends Cubit<State> {
  final _compositeSubscription = CompositeSubscription();

  HvCubit(State initialState) : super(initialState);

  /// closes StreamSubscription together with Cubit
  StreamSubscription closeWithCubit(StreamSubscription subscription) {
    if (!_compositeSubscription.isDisposed) {
      _compositeSubscription.add(subscription);
    }
    return subscription;
  }

  @override
  Future<void> close() {
    if (!_compositeSubscription.isDisposed) {
      _compositeSubscription.dispose();
    }
    return super.close();
  }
}

extension HvCubitFStreamExtensions<T> on Stream<Fetchable<T>> {
  /// Wraps Stream errors with Fetchable.error(e). If error is unexpected one
  /// then throws it into our error handler [mainErrorHandler]
  StreamSubscription presentF(
    HvCubit cubit,
    void Function(Fetchable<T> F) onData, {
    void Function(dynamic e, StackTrace s)? onUnexpectedError,
    bool Function(dynamic e)? isExpectedError,
  }) {
    return cubit.closeWithCubit(listen(onData, onError: (e, s) {
      final isExpected =
          e is NoConnectionException || (isExpectedError != null && isExpectedError(e));
      onData(Fetchable.error(e));
      if (!isExpected) {
        onUnexpectedError?.call(e, s);
        log('error caught by presentF');
        mainErrorHandler(e, s);
      }
    }));
  }
}

extension HvCubitPStreamExtension on Stream<Progressable> {
  /// Wraps Stream errors with Progressable.error(e). If error is unexpected one
  /// then throws it into our error handler [mainErrorHandler]
  StreamSubscription presentP(
    HvCubit cubit,
    void Function(Progressable P) onData, {
    void Function(dynamic e, StackTrace s)? onUnexpectedError,
    bool Function(dynamic e)? isExpectedError,
  }) {
    return cubit.closeWithCubit(listen(onData, onError: (e, s) {
      final isExpected =
          e is NoConnectionException || (isExpectedError != null && isExpectedError(e));
      onData(Progressable.error(e));
      if (!isExpected) {
        onUnexpectedError?.call(e, s);
        log('error caught by presentP');
        mainErrorHandler(e, s, showErrorInUI: false);
      }
    }));
  }
}
