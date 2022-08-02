// import 'package:flutter_test/flutter_test.dart';
// import 'package:ourtube_app/domain/enums/trade_exception.dart';
// import 'package:ourtube_app/domain/models/base_validation_model.dart';
// import 'package:ourtube_app/domain/models/trade/trade_buy_request_model.dart';
// import 'package:ourtube_app/domain/usecases/trade/trade_check_valid_buy_request_use_case.dart';
//
// // class TradeCheckValidBuyRequestUseCaseTest extends Mock implements TradeCheckValidBuyRequestUseCase {}
//
// // @GenerateMocks([TradeCheckValidBuyRequestUseCaseTest])
// Future<void> main() async {
//   late TradeCheckValidBuyRequestUseCase validBuyRequestUseCase;
//
//   setUpAll(() {
//     validBuyRequestUseCase = TradeCheckValidBuyRequestUseCase();
//     validBuyRequestUseCase.onInit(availableCash: 12345670, channelSupply: 1000);
//   });
//   test('case 1: cash=15000, quantity=20', () async {
//     final model = BaseValidationModel(isValid: true);
//
//     final res = await validBuyRequestUseCase.call(
//       TradeBuyRequestModel(
//         channelId: '',
//         orderCashPerOneStock: 15000,
//         quantity: 20,
//       ),
//     );
//
//     expect(res.isValid, model.isValid);
//     expect(res.exception, model.exception);
//   });
//   test('case 2: cash=17892, quantity=55', () async {
//     final model = BaseValidationModel(isValid: false, exception: const BuyCashPerOneStockNotDividedByUnitPriceException());
//
//     final res = await validBuyRequestUseCase.call(
//       TradeBuyRequestModel(
//         channelId: '',
//         orderCashPerOneStock: 17892,
//         quantity: 55,
//       ),
//     );
//
//     expect(res.isValid, model.isValid);
//     expect(res.exception, model.exception);
//   });
// }
// 2:22
// dio_queued_interceptors_test.dart
// 새 항목
// 2:22
// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   /*test('All of the requests enter the interceptor at once, rather than executing sequentially.', () async {
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (
//             RequestOptions requestOptions,
//             RequestInterceptorHandler handler,
//             ) {
//           print(requestOptions.uri);
//           Future.delayed(const Duration(seconds: 2), () {
//             print('request passed!');
//             handler.next(requestOptions);
//           });
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
//           print('response passed!');
//           handler.next(response);
//         },
//         onError: (DioError err, ErrorInterceptorHandler handler) {
//           print('error passed : $err');
//           dio.get('/200');
//           handler.next(err);
//         },
//       ),
//     );
//     await makeRequests(dio);
//   });*/
//
//   test('All of the requests enter the interceptor sequentially by QueuedInterceptors', () async {
//     var dio = Dio();
//     var tokenDio = Dio();
//     String? token = 'none';
//
//     dio.options.baseUrl = 'http://httpbin.org/status/';
//     tokenDio.options = dio.options;
//     dio.interceptors.add(
//       // [QueuedInterceptorsWrapper] is a helper class, which is used to conveniently create QueuedInterceptor.
//       QueuedInterceptorsWrapper(
//         onRequest: (
//             RequestOptions requestOptions,
//             RequestInterceptorHandler handler,
//             ) {
//           print(requestOptions.uri);
//           Future.delayed(const Duration(seconds: 2), () {
//             print('${requestOptions.uri} request passed!');
//             handler.next(requestOptions);
//           });
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
//           print('response passed. token : $token');
//           handler.next(response);
//         },
//         onError: (DioError err, ErrorInterceptorHandler handler) {
//           print('error passed : $err.  token : $token');
//           if(token == 'none') {
//             tokenDio.get('/200').then((r) {
//               handler.resolve(r);
//             }, onError: (e) {
//               handler.reject(e);
//             },);
//
//             return;
//           }
//
//           return handler.reject(err);
//         },
//       ),
//     );
//
//     tokenDio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
//           print('   tokenDio : ${requestOptions.uri} request passed!');
//           handler.next(requestOptions);
//         },
//         onResponse: (Response response, ResponseInterceptorHandler handler) {
//           print('   tokenDio : response passed!');
//           token = 'hahaha';
//           handler.next(response);
//         },
//         onError: (DioError err, ErrorInterceptorHandler handler) {
//           print('   tokenDio : error passed : $err');
//           handler.next(err);
//         },
//       ),
//     );
//
//     await makeRequests(dio);
//   });
// }
//
// Future makeRequests(Dio dio) async {
//   await Future.wait([
//     dio.get('/404'),
//     dio.get('/405'),
//     dio.get('/409'),
//   ]);
// }
