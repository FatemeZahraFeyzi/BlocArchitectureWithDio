import 'package:dio_example/data/model/user.dart';
import 'package:dio_example/data/provider/user_api_client.dart';

class UserRepository {
  final ApiClient apiClient;

  UserRepository({required this.apiClient});

  Future<User> fetchUser({required String id}) async {
    return await apiClient.getUser(id: id);
  }
}
