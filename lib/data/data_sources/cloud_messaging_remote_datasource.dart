import '../core/network/api_client.dart';

abstract class CloudMessagingRemoteDataSource {
  Future<void> sendMessage(Map<String, dynamic> requestBody);
}

class CloudMessagingRemoteDataSourceImpl
    extends CloudMessagingRemoteDataSource {
  final ApiClient _client;

  CloudMessagingRemoteDataSourceImpl(this._client);
  @override
  Future<void> sendMessage(Map<String, dynamic> requestBody) async {
    final response = await _client.postNotiSever(params: requestBody);

    return response;
  }
}
