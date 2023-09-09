import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/error/exception.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/commons.dart';

class MenuRepository {
  Future<Either<String, String>> addDishToMenu({
    required XFile image,
    required String mealName,
    required double mealPrice,
    required String mealDesc,
    required String mealCategory,
    required String howToSell,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.addMeal,
      
       isFormData:true,
       data: {
        Apikeys.name: mealName,
        Apikeys.price: mealPrice,
        Apikeys.description: mealDesc,
        Apikeys.category: mealCategory,
        Apikeys.howToSell: howToSell,
        Apikeys.mealImages: await uploadImageToAPI(image),
      });
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteMeal({
    required String id,
  }) async {
    try {
      final response = await sl<ApiConsumer>().delete(
        EndPoint.getDeleteMealEndPoints(id),
      );
      return Right(response[Apikeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetAllMealModel>> getMeal() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getAllChefMeals(sl<CacheHelper>().getData(key: Apikeys.id)),
      );
      return Right(GetAllMealModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
