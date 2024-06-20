class ServerResponse {
  bool? isSuccess;
  String? message;
  dynamic result;
  int statusCode;
  dynamic headersResult;

  ServerResponse(
      {this.isSuccess,
      this.message,
      this.result,
      required this.statusCode,
      this.headersResult});

  dynamic get response {
    return result;
  }
}
