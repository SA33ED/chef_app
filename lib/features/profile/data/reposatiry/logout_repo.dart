import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/service_locator.dart';

class LogoutRepository {
  Future<Either<String, String>> logoutChef() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.logout
      );
      return Right((response[Apikeys.message]));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}