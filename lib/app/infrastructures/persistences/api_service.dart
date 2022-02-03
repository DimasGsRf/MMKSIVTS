import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';
import 'package:soid_mobile/app/infrastructures/event/dio_error.dart';
import 'package:soid_mobile/app/infrastructures/event/dio_success.dart';
import 'package:soid_mobile/data/infrastructures/api_service_interface.dart';

class ApiService extends ApiServiceInterface {
  late Dio dio;
  late EventBus eventBus;
  late bool needThrowError;

  ApiService(Dio _dio, EventBus _eventBus) {
    dio = _dio;
    eventBus = _eventBus;
    needThrowError = false;
  }

  // send http request
  Future<dynamic> invokeHttp(dynamic url, RequestType type,
      {Map<String, String>? headers,
      dynamic body,
      String? contentType,
      Map<String, String>? params,
      Encoding? encoding,
      bool needThrowError = true}) async {
    Response response;

    this.needThrowError = needThrowError;

    try {
      response = await _invoke(
        url,
        type,
        headers: headers,
        body: jsonEncode(body),
        params: params,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  // setup requiest type and configuration
  Future<Response> _invoke(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, String>? params,
  }) async {
    Response response;

    try {
      switch (type) {
        case RequestType.GET:
          response = await dio.get(
            url,
            options: buildCacheOptions(
              Duration(days: 7),
              options: Options(headers: headers),
              forceRefresh: true,
              maxStale: Duration(days: 7),
            ),
            queryParameters: params,
          );
          break;
        case RequestType.POST:
          response = await dio.post(
            url,
            data: body,
            options: Options(
              headers: headers,
            ),
          );
          break;
        case RequestType.PUT:
          response = await dio.put(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.PATCH:
          response = await dio.patch(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.DELETE:
          response = await dio.delete(url, options: Options(headers: headers));
          break;
      }

      // TODO: Uncomment this for later
      // if (response.data['success'] == false) {
      //   throw DioError(
      //     response: Response(
      //       statusCode: response.statusCode,
      //       data: {
      //         'message': response.data['message'],
      //         'origin': response.data['origin'],
      //         'data': response.data['data']
      //       },
      //       requestOptions: RequestOptions(
      //         data: {
      //           'message': response.data['message'],
      //           'origin': response.data['origin'],
      //           'data': response.data['data']
      //         },
      //         path: '',
      //       ),
      //     ),
      //     requestOptions: RequestOptions(
      //       data: {
      //         'message': response.data['message'],
      //         'origin': response.data['origin'],
      //         'data': response.data['data']
      //       },
      //       path: '',
      //     ),
      //   );
      // }

      // notifySucces(response);
      return response;
    } on DioError catch (e) {
      this.notifyError(e.response);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  void notifyError(Response? resp) {
    if (!this.needThrowError) return;

    eventBus.fire(
      DioErrorEvent(
        code: resp?.statusCode ?? 408,
        message: resp == null || resp.data is String
            ? 'Connection Timeout'
            : resp.data['message'],
        origin: resp == null || resp.data is String
            ? 'default'
            : resp.data['origin'],
      ),
    );
  }

  void notifySucces(Response? resp) {
    String defaultMessage = "no response message from API";

    eventBus.fire(
      DioSuccesEvent(message: resp?.data['message'] ?? defaultMessage),
    );
  }
}
