import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class DioOptions {
  final int? clientId;
  final String? contentType;

  DioOptions({
    this.clientId,
    this.contentType,
  });

  DioOptions copyWith({
    int? clientId,
    String? contentType,
    String? userRole,
  }) {
    return DioOptions(
      clientId: clientId ?? this.clientId,
      contentType: contentType ?? this.contentType,
    );
  }
}

class DioClient {
  final String baseUrl = const String.fromEnvironment('API_URL');
  String jwtToken = '';

  Future<Dio> _createDio([DioOptions? options, String? baseUrlParam]) async {
    UserBloc userBloc = GetService.getBloc(() => UserBloc());

    var token = userBloc.state.user?.token ?? '';

    jwtToken = token ?? '';

    final dio = Dio(BaseOptions(
      baseUrl: baseUrlParam ?? baseUrl,
      headers: {
        'Content-Type': options?.contentType ?? 'application/json',
        'Authorization': 'Bearer $token',
        // 'Peetly-Params': peetlyParams,
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        if (kDebugMode) {
          print('Request: ${options.method} ${options.uri} ${options.headers}');
        }
        options.extra['startTime'] = DateTime.now().millisecondsSinceEpoch;
        // print('Headers: ${options.headers}');
        if (kDebugMode) {
          print('Data: ${options.data}');
        }
        handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        final startTime = response.requestOptions.extra['startTime'];
        if (startTime != null) {
          final duration = DateTime.now().millisecondsSinceEpoch - startTime;
          print('Request took: $duration ms');
        }

        // print('Extra: ${response.extra}');

        handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        if (kDebugMode) {
          print('error $error');
        }
        if (error.response != null) {
          if (kDebugMode) {
            print('Mensagem de erro: ${error.response!.data}');
          }

          if (error.response?.statusCode == 401) {
            GetService.snackbarError('Sessão expirada, por favor refaça o login para continuar usando a plataforma.', message: '');
          }

          var data = error.response?.data;
          if (data is Map) {
            var errorMessage = data['message'];
            if (errorMessage != null) {
              if (errorMessage is String) {
                GetService.snackbarError(errorMessage);
              } else if (errorMessage is List) {
                if (errorMessage.isNotEmpty) {
                  GetService.snackbarError(errorMessage[0]);
                }
              }
            }
          }
        } else {
          if (kDebugMode) {
            print('Erro desconhecido: $error');
          }
        }

        handler.next(error);
      },
    ));

    return dio;
  }

  Future<Response> get(
      String endpoint, [
        DioOptions? options,
        ProgressCallback? onReceiveProgress,
      ]) async {
    final dio = await _createDio(options);

    return await dio.get(endpoint, onReceiveProgress: onReceiveProgress);
  }

  Future<Response> getSpecific(
      String baseUrl,
      String endpoint, [
        DioOptions? options,
        ProgressCallback? onReceiveProgress,
      ]) async {
    final dio = await _createDio(options, baseUrl);

    return await dio.get(endpoint, onReceiveProgress: onReceiveProgress);
  }

  Future<Response> put(
      String endpoint,
      dynamic data, [
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        DioOptions? options,
      ]) async {
    final dio = await _createDio(options);

    return await dio.put(
      endpoint,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
      String endpoint,
      dynamic data, [
        DioOptions? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      ]) async {
    final dio = await _createDio(options);

    return await dio.post(
      endpoint,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> postFormData<T>(
      String endpoint,
      dynamic data, [
        DioOptions? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      ]) async {
    if (options != null) {
      options = options.copyWith(contentType: 'multipart/form-data');
    } else {
      options = DioOptions(contentType: 'multipart/form-data');
    }

    final dio = await _createDio(options);

    return await dio.post(
      endpoint,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> postUrlEncoded(String endpoint, dynamic data) async {
    final options = DioOptions(contentType: 'application/x-www-form-urlencoded');
    final dio = await _createDio(options);

    return await dio.post(
      endpoint,
      data: data,
    );
  }
}
