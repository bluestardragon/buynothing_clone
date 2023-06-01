import 'package:baseproject/src/home_page/ui/pages/listing_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/widget/ui/custom_navigator_pop_scope.dart';
import '../../di/home_page_providers.dart';
import '../model/home_page_navigation_state.dart';
import '../pages/home_page.dart';
import '../pages/listing_detail_page.dart';
import '../viewmodel/home_page_view_model_main.dart';

final _homePageNavigationKey = GlobalKey<NavigatorState>();

class HomePageNavigator extends StatefulWidget {
  final Future<bool> Function()? onMainPop;

  const HomePageNavigator({
    required this.onMainPop,
  });

  @override
  _HomePageNavigatorState createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: homePageProviders,
      child: Consumer<HomePageViewModelMain>(
        builder: (_, viewModel, __) {
          return CustomNavigatorPopScope(
            navigatorStateKey: _homePageNavigationKey,
            pages: [
              MaterialPage(
                child: HomePage(
                  viewModel: viewModel,
                  onPop: widget.onMainPop,
                ),
              ),
              if (viewModel.homeNavigationState == HomePageNavigationState.detailListPage)
                MaterialPage(
                  child: ListingDetailPage(
                    onPop: () => viewModel.homeNavigationState = HomePageNavigationState.baseHomePage,
                    viewModel: viewModel,
                  ),
                ),
              if (viewModel.homeNavigationState == HomePageNavigationState.editListPage)
                MaterialPage(
                  child: ListingEditPage(
                    onPop: () => viewModel.homeNavigationState = HomePageNavigationState.detailListPage,
                    viewModel: viewModel,
                  ),
                ),
            ],
            onPopPage: (route, result) {
              viewModel.homeNavigationState =
                  HomePageNavigationState.baseHomePage;
              return false;
            },
          );
        },
      ),
    );
  }
}
