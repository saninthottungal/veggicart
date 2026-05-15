sealed class Result<S, E> {
  const Result();
}

class Success<S, E> extends Result<S, E> {
  final S value;
  const Success(this.value);
}

class Failure<S, E> extends Result<S, E> {
  final E error;
  final E? description;
  const Failure(this.error, {this.description});
}
