import 'package:dartz/dartz.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/services/service_locator.dart';

class ChangePasswordRepository {
  Future<Either<String, String>> changePassword({
    required String oldPass,
    required String newPass,
    required String confirmPassword,
  }) async {
    try {
      final responese = await sl<ApiConsumer>().patch(
        EndPoint.chefChangePassword,
        data: {
          Apikeys.oldPass: oldPass,
          Apikeys.newPass: newPass,
          Apikeys.confirmPassword: confirmPassword,
        },
      );
      return Right(responese[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
