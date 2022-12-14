part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

class GetRandom extends QuoteEvent {}

class GetQuotesList extends QuoteEvent {}

class GetAuthorsList extends QuoteEvent {}
