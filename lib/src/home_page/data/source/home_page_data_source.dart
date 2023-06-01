import 'package:baseproject/src/base/models/listings/listings_filter_model.dart';
import 'package:baseproject/src/base/models/listings/listings_response.dart';

abstract class HomePageDataSource {
  Future<ListingsDetailResponse> getListings(ListingsFilterModel filters);
}
