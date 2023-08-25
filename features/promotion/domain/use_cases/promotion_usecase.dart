import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/promotion_repository.dart';

class PromotionUsecase extends UseCase {
  PromotionRepository repository;
  PromotionUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }


}
