import '../utils/request.dart';

class AuthRequest {
  static getArray(params) async {
    var response = await Service.request('/shuffling/list',
        data: params, method: Service.GET);
    return response;
  }
}
