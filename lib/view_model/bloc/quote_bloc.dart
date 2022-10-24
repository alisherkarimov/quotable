import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quotable/model/quote.dart';
import 'package:quotable/model/repositories/random_repository.dart';

part 'quote_event.dart';

part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<QuoteEvent>((event, emit) {});
    on<GetRandom>(_mapGetRandomEventToState);
    on<GetQuotesList>((event, emit) {});
    on<GetAuthorsList>((event, emit) {});
  }

  void _mapGetRandomEventToState(
      GetRandom event, Emitter<QuoteState> emit) async {
    emit(QuoteLoading());
    try {
      final quote = await RandomRepository().fetchRandom();
      emit(QuoteSuccess(quote));
    } catch (e) {
      print(e.toString());
      emit(QuoteError(e.toString()));
    }
  }
}
