import 'package:dio/dio.dart';

abstract class PromotionRemoteDataSource {
 // Future<FlightResponseModel> flightUser(FlightRequestModel params);
}

class AuthRemoteDataSourceImp implements PromotionRemoteDataSource {
  Dio dio;
  AuthRemoteDataSourceImp({required this.dio});

  //@override
 // Future<FlightResponseModel> flightUser(FlightRequestModel params) {
    // TODO: implement loginUser
   // throw UnimplementedError();
//  }


}
