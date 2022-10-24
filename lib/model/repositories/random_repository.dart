import 'package:quotable/model/services/random_service.dart';

import '../../core/base_service.dart';
import '../quote.dart';

class RandomRepository {
  final BaseService _genresService = RandomService();

  Future<Quote> fetchRandom() async {
    dynamic response = await _genresService.getResponse("/random");
    final quote = Quote.fromJson(response);
    return quote;
  }
}
