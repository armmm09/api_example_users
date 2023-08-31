library api;

import 'package:fetchly/fetchly.dart';

part 'auth_api.dart';
part 'users_api.dart';

mixin UseApi {
  UsersApi userApi = UsersApi();
  AuthApi authApi = AuthApi();
}
