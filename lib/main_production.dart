// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app_klass/app/app.dart';
import 'package:flutter_app_klass/app/app_bloc_observer.dart';

void main() {
  
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  EquatableConfig.stringify=true;

  runZonedGuarded(
    () => runApp( App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
