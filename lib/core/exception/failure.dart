import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    this.code = '',
    this.message = '',
  });

  final String code;
  final String message;

  @override
  List<Object> get props => [code, message];
}
