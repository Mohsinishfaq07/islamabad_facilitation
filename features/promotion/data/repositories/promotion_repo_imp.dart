import '../../../../core/utils/network/network_info.dart';
import '../../domain/repositories/promotion_repository.dart';
import '../data_sources/promotion_remote_data_source.dart';

class PromotionRepoImp extends PromotionRepository {
  final NetworkInfo networkInfo;

  final PromotionRemoteDataSource remoteDataSource;

  PromotionRepoImp({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  
}