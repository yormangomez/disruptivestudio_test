import 'package:api_helper/api_helper.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class ExampleResource {
  /// {@macro example_resource}
  ExampleResource({
    required this.centerApi,
  });

  final CenterApi centerApi;

  /// Returns
  Future<dynamic> example({required String id}) async {
    try {
      final response =
          await centerApi.delete(data: {}, urlSpecific: Server.userUpdate(id));

      if (response.statusCode == 200) {
        return response.result;
      } else {
        throw GeneralException(response.message ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
