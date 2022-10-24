part of 'quote_bloc.dart';

@immutable
abstract class QuoteState extends Equatable {
  const QuoteState();
}

class QuoteInitial extends QuoteState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class QuoteSuccess extends QuoteState {
  Quote quote;

  QuoteSuccess(this.quote);

  @override
  List<Object?> get props => [quote];
}

class QuoteError extends QuoteState {
  String message;

  QuoteError(this.message);

  @override
  List<Object?> get props => [message];
}

class QuoteLoading extends QuoteState {
  @override
  List<Object?> get props => [];
}
