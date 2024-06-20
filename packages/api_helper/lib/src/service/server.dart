class Server {
  // Only change this parameter in case you need to change
  // the environment.
  static bool isTrueEnv = false;

  // Endpoints (PENDING TO REFACTOR NOT USE)
  static const String _user = '/user/';

  static const String _refreshToken = 'users/rest-auth/token/refresh/';

  // Refactoring !! Important to follow the correct path (USE THIS)

  // Full url (PENDING TO REFACTOR NOT USE)
  static String get user => _user;

  static String get refreshToken => _refreshToken;
  //static String store(int idStore) => "$_api$_storeStores$idStore/";

  static String userUpdate(String id) => "$_user$id";
}
