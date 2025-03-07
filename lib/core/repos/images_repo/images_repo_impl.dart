import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruitify_dashboard/core/errors/failures.dart';
import 'package:fruitify_dashboard/core/services/stoarage_service.dart';
import 'package:fruitify_dashboard/core/utils/backend_endpoint.dart';

import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StoarageService stoarageService;

  ImagesRepoImpl(this.stoarageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await stoarageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to uoload image'),
      );
    }
  }
}
