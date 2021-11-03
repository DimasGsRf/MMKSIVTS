import 'package:sfid_mobile/data/payload/contracts/user_request.dart';

class UpdateFirebaseTokenApiRequest
    extends UpdateFirebaseTokenRequestInterface {
  String _token;

  UpdateFirebaseTokenApiRequest(this._token);

  Map<String, dynamic> toJson() {
    var data = {"token": _token};

    return {"data": data};
  }
}
