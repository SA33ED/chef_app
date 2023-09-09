import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/service_locator.dart';
import '../models/get_data_profile_model.dart';

class ProfileRepository {
  Future<Either<String, GetDataChefModel>> getChefData() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getChefDataEndPoints(
            sl<CacheHelper>().getData(key: Apikeys.id)),
      );
      return Right(GetDataChefModel.fromJson(response[Apikeys.chef]));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
