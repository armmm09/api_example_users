import 'package:api_example_users/app/data/models/users.dart';
import 'package:fetchly/fetchly.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../data/api/api.dart';

class UserNotifier extends StateNotifier<AsyncValue<List<Users>>>
    with UseApi {
  final AutoDisposeStateNotifierProviderRef?
      ref; // if you want to use ref inside this provider

  UserNotifier({this.ref}) : super(const AsyncValue.loading()) {
    // get data produk saat pertama kali halaman produk dimuat
    getUsers();
  }

  Future getUsers() async {
    try {
      // set loading state
      state = const AsyncValue.loading();

      // call api
      ResHandler res = await userApi.getUsers();

      // prepare data
      List data = res.body?['users'] ?? [];

      // set data
      state = AsyncValue.data(data.map((e) => Users.fromJson(e)).toList());
    } catch (e, s) {
      Errors.check(e, s, useList: true);
    }
  }

   Future deleteLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    
    
    prefs.remove('id');
}

  
}

final userProvider = StateNotifierProvider.autoDispose<UserNotifier,
    AsyncValue<List<Users>>>((ref) {
  return UserNotifier(ref: ref);
});
