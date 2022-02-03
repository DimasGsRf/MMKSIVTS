import 'package:mmksi_vts_mobile/data/payload/contracts/request_mapper.dart';

abstract class UserRepository {
  Future<bool> updateFirebaseToken(JsonRequest request);
}
