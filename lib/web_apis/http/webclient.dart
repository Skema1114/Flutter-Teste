import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';

void findAll() async {
  //localhost não funciona nessa parte, pq localhost é o pc e o emulador nao encherga
  // final String url = 'http://localhost:8080/transactions';
  //precisa ser utilizado o ip do pc pra funfar
  final String ip_server = '192.168.2.172';
  final String porta_server = '8080';
  final String funcao_api = 'transactions';

  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );
  final Response response =
      await client.get('http://$ip_server:$porta_server/$funcao_api');
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('============ REQUEST ============');
    //no curso é
    //print('URL = ${data.requestUrl}');
    print('URL: ${data.toHttpRequest()}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    print('============ ======== ============');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('============ RESPONSE ============');
    //no curso é
    //print('URL = ${data.requestUrl}');
    print('STATUS CODE: ${data.statusCode}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    print('============ ======== ============');
    return data;
  }
}
