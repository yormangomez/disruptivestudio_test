import 'package:api_helper/api_helper.dart';
import 'package:api_repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  ExampleResource exampleResource;

  ExampleRepositoryImpl({
    required this.exampleResource,
  });
  
  @override
  Future<Either<Failure, dynamic>> example({required String id}) async {
    try {
      final exampleModel = await exampleResource.example(id: id);
  
      return Right(exampleModel);
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}
