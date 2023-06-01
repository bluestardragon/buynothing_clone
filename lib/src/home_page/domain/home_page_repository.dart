import 'package:baseproject/src/base/models/listings/listings_filter_model.dart';

import '../../base/models/listings/listings_response.dart';

abstract class HomePageRepository {
  Future<ListingsDetailResponse> getPosts(ListingsFilterModel filters);
}
