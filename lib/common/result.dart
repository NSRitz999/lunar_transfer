class Result<T1, T2> {
  const Result._({this.success, this.failure});

  /// Initializes a [Result] class marked as "Success"
  const Result.success(T1 value)
      : success = value,
        failure = null;

  /// Initializes a [Result] class marked as "Failure"
  const Result.failure(T2 value)
      : failure = value,
        success = null;

  /// The value if the [Result] class is a success, otherwise [null]
  final T1? success;

  /// The value if the [Result] class is a failure, otherwise [null]
  final T2? failure;

  /// [True] if success is not [null], [False] otherwise
  bool get isSuccess => success != null;

  /// [True] if failure is not [null], [False] otherwise
  bool get isFailure => failure != null;
}
