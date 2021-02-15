import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/indicator.dart';

/* Events */
abstract class AppEvent {}

class RefreshEvent extends AppEvent {}

/* States */
abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class FailureState extends AppState {
  final dynamic error;

  FailureState(this.error);
}

class HubBloc extends Bloc<AppEvent, AppState> with WidgetsBindingObserver {
  HubBloc() : super(InitialState()) {
    add(RefreshEvent());
  }

  IndicatorModel _indicator;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield* _mapEventToState(event);
  }

  Stream<AppState> _mapEventToState(AppEvent event) async* {
    try {
      yield LoadingState();

      String data = await _fetchData();

      dynamic json = jsonDecode(data);

      _indicator = IndicatorModel.fromJson(json);

      yield InitialState();
    } catch (err) {
      yield FailureState(err);
    }
  }

  Future<String> _fetchData() async {
    /// Delay to mimic a get request
    await Future.delayed(Duration(seconds: 3));

    return await rootBundle.loadString("assets/data.json");
  }

  /// An actual get request
  //Future<String> _fetchData() async {
  //  Response data = get('REQUEST_API');w

  //  return data.body;
  //}

  IndicatorModel get indicator => _indicator;
}
