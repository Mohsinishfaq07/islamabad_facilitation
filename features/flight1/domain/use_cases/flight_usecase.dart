import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/flight_repository.dart';

class FlightUsecase extends UseCase {
  FlightRepository repository;
  FlightUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, FlightResponseModel>> call(FlightRequestModel params) async {
  //   return await repository.flightUser(params);
  // }
}
