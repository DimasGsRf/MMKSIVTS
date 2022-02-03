import 'package:soid_mobile/data/payload/contracts/request_mapper.dart';

class UpdateFirebaseTokenApiRequest extends JsonRequest {
  String _token;

  UpdateFirebaseTokenApiRequest(this._token);

  @override
  Map<String, dynamic> toJson() {
    var data = {"token": _token};

    return {"data": data};
  }
}
