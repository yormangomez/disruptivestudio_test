import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class CoinsRepositoryImpl extends CoinsRepository {
  CoinsResource coinsResource;

  CoinsRepositoryImpl({
    required this.coinsResource,
  });

  @override
  Future<Either<Failure, List<CoinsModel>>> coinsMarkets() async {
    try {
      final coinsModel = await coinsResource.coinsMarkets();

      return Right(coinsModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<List>>> coinsKlines({
    required String symbol,
  }) async {
    try {
      final coinsModel = await coinsResource.coinsKlines(symbol: symbol);

      return Right(coinsModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
