import 'package:dartz/dartz.dart';
import 'package:sb_myreports/core/error/failures.dart';
import '../../../../core/utils/network/network_info.dart';
import '../../domain/repositories/flight_repository.dart';
import '../data_sources/flight_remote_data_source.dart';

class FlightRepoImp extends FlightRepository {
  final NetworkInfo networkInfo;

  final FlightRemoteDataSource remoteDataSource;

  FlightRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, dynamic>> flightUser(params) {
    // TODO: implement flightUser
    throw UnimplementedError();
  }

  
}