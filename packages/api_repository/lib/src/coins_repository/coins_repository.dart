import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class CoinsRepository {
  Future<Either<Failure, List<CoinsModel>>> coinsMarkets();
  Future<Either<Failure, List<List>>> coinsKlines({
    required String symbol,
  });
}
