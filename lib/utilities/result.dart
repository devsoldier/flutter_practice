import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  final ResultStatus? status;
  final String? message;
  final T? data;

  const Result({
    this.status,
    this.message,
    this.data,
  });

  factory Result.loading() => const Result(status: ResultStatus.loading);

  factory Result.idle() => const Result(status: ResultStatus.idle);

  factory Result.failure(dynamic message) => Result(
        status: ResultStatus.failure,
        message: message.toString(),
      );

  factory Result.success(T result) => Result(
        status: ResultStatus.success,
        data: result,
      );

  factory Result.empty() => const Result(status: ResultStatus.empty);

  @override
  String toString() {
    return 'Result{status: $status, message: $message, data: $data}';
  }

  Result copyWith({
    ResultStatus? status,
    String? message,
    T? data,
  }) {
    return Result(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  bool get isLoading => status == ResultStatus.loading;
  bool get isSuccess => status == ResultStatus.success;
  bool get isFailure => status == ResultStatus.failure;
  bool get isIdle => status == ResultStatus.idle;
  bool get isEmpty => status == ResultStatus.empty;

  @override
  List<Object?> get props => [status, data, message];
}

enum ResultStatus {
  loading,
  failure,
  success,
  idle,
  empty,
}
