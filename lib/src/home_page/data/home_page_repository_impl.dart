import 'package:baseproject/src/base/models/listings/listings_filter_model.dart';

import 'package:baseproject/src/base/models/listings/listings_response.dart';

import '../domain/home_page_repository.dart';
import 'source/home_page_data_source.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final HomePageDataSource _homePageRemoteDataSource;

  HomePageRepositoryImpl(this._homePageRemoteDataSource);

  @override
  Future<ListingsDetailResponse> getPosts(ListingsFilterModel filters) => _homePageRemoteDataSource.getListings(filters);
}
