import 'package:api_helper/api_helper.dart';

/// {@template example_resource}
/// An api resource to get the prompt terms.
/// {@endtemplate}
class CoinsResource {
  /// {@macro example_resource}
  CoinsResource({
    required this.centerApi,
  });

  final CenterApi centerApi;

  /// Returns
  Future<List<CoinsModel>> coinsMarkets() async {
    try {
      final response = await centerApi.get(
          urlSpecific:
              'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');

      if (response.statusCode == 200) {
        final data = (response.result as List)
            .map((e) => CoinsModel.fromJson(e))
            .toList();
        return data;
      } else {
        throw GeneralException(response.message ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  Future<List<List>> coinsKlines({
    required String symbol,
  }) async {
    try {
      final response = await centerApi.get(
          urlSpecific:
              'https://api.binance.com/api/v3/klines?symbol=$symbol&interval=1h&limit=100');

      if (response.statusCode == 200) {
        List<List> listData = [];

        if (response.result is List) {
          // Verifica cada elemento en la lista para asegurar que son listas también
          for (var element in response.result) {
            if (element is List) {
              // Agrega cada elemento a listData como una lista de objetos
              listData.add(List<Object>.from(element));
            } else {
              // Manejo de error si un elemento no es una lista
              print("Elemento no es una lista: $element");
            }
          }
        } else {
          // Manejo de error si response.result no es una lista
          print("response.result no es una lista");
        }

        return listData;
      } else {
        throw GeneralException(response.message ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
