import 'package:sfid_mobile/data/payload/contracts/user_request.dart';

abstract class UserRepository {
  Future<bool> updateFirebaseToken(UpdateFirebaseTokenRequestInterface request);
}
