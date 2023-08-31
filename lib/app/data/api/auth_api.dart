part of api;

class UsersApi extends Fetchly {
  Future<ResHandler> getUsers() async => await get('users');
   Future<ResHandler> deleteLocalData() async {
    return await delete('users');  
  }
}

