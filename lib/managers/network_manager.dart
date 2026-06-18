import '../constants/app_imports.dart';

class AppConfigs {
  static String baseUrl = AppUrls.baseUrl;
  static final String route = AppUrls.routeUrl;
}

enum HttpMethod { Get, Post, Put, Patch, Delete }

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() {
    return _singleton;
  }

  NetworkManager._internal() {
    _initDio();
  }

  Dio dio = Dio();

  void _initDio() {
    dio.options.baseUrl = AppConfigs.baseUrl + AppConfigs.route;
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    dio.options.contentType = Headers.jsonContentType;

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = PrefManager.getToken();
          if (token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              final newToken = await refreshToken();
              if (newToken != null) {
                PrefManager.setToken(newToken);

                final RequestOptions requestOptions = error.requestOptions;
                requestOptions.headers["Authorization"] = "Bearer $newToken";

                final retryResponse = await dio.fetch(requestOptions);

                return handler.resolve(retryResponse);
              }
            } catch (e) {
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> refreshToken() async {
    // final refreshToken = PrefManager.getRefreshToken();
    // if (refreshToken.isEmpty) return null;
    //
    // try {
    //   final response = await dio.post(
    //     AppUrls.refreshToken,
    //     data: {'refreshToken': refreshToken},
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final newToken = response.data['accessToken'];
    //     return newToken;
    //   }
    // } catch (e) {
    //   Get.offAllNamed(Routes.LOGIN);
    // }

    return null;
  }

  Future<Response?> callApi({
    HttpMethod? method,
    required String urlEndPoint,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    dynamic body,
    bool isFormDataRequest = false,
    FormData? formData,
    Function onSuccess(Response response)?,
    Function onError(dynamic error)?,
    Function onConnect(bool isConnected)?,
    withoutLoader = false,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.none) {
      Utils.toastMessage(
        "No internet connection. Please check your connection.",
      );
      return null;
    }

    var base = baseUrl ?? AppConfigs.baseUrl;

    var requestURL = base + AppConfigs.route + urlEndPoint;
    Options requestOptions = options ?? Options();

    if (isFormDataRequest) {
      requestOptions.contentType = "multipart/form-data";
    } else {
      requestOptions.contentType = Headers.jsonContentType;
    }

    try {
      if (!withoutLoader) {
        Utils.showLoader();
      }
      switch (method) {
        case HttpMethod.Get:
          Response response = await dio.get(
            requestURL,
            queryParameters: queryParameters,
            options: options,
          );
          if (!withoutLoader) Utils.hideLoader();

          return response;
        case HttpMethod.Post:
          Response response = await dio.post(
            requestURL,
            queryParameters: queryParameters,
            options: requestOptions,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: isFormDataRequest ? formData : body,
          );
          if (!withoutLoader) Utils.hideLoader();

          return response;
        case HttpMethod.Put:
          Response response = await dio.put(
            requestURL,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: body,
          );
          if (!withoutLoader) Utils.hideLoader();

          return response;
        case HttpMethod.Patch:
          break;
        case HttpMethod.Delete:
          Response response = await dio.delete(requestURL, data: body, queryParameters: queryParameters);

          if (!withoutLoader) Utils.hideLoader();

          return response;
        case null:
      }
    } on DioException catch (error) {
      if (!withoutLoader) Utils.hideLoader();

      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        Utils.toastMessage('Poor Internet Connection');
      } else {
        if (error.response != null) {
          Map<String, dynamic>? errorResponse = error.response!.data;
          Response errResponse = Response(
            data: errorResponse,
            statusCode: error.response!.statusCode,
            requestOptions: RequestOptions(),
          );
          return errResponse;
        } else {
          return null;
        }
      }
    }
    return null;
  }
}
