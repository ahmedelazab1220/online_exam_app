import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/data/api/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/profile/user_data/response/profile_data_response_dto.dart';

part 'profile_retrofit_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileRetrofitClient {
  @factoryMethod
  factory ProfileRetrofitClient(Dio dio) = _ProfileRetrofitClient;


  @GET(ApiConstants.profileDataRoute)
  Future<ProfileDataResponseDto> getProfileData(
      @Header("token") String token,
      );




}