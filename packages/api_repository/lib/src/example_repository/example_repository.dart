import 'package:api_helper/api_helper.dart';
import 'package:dartz/dartz.dart';

abstract class ExampleRepository {
  Future<Either<Failure, dynamic>> example({required String id});
}
