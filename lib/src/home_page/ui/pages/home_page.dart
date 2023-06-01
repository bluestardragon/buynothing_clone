import 'dart:ffi';

import 'package:baseproject/src/home_page/ui/model/home_page_navigation_state.dart';
import 'package:baseproject/src/home_page/ui/widget/home_listing_card.dart';
import 'package:baseproject/src/start/ui/widgets/start_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../base/widget/ui/paginated_list.dart';
import '../viewmodel/home_page_view_model_main.dart';
import '../widget/home_card.dart';

class HomePage extends StatefulWidget {
  final HomePageViewModelMain viewModel;
  final Future<bool> Function()? onPop;

  const HomePage({
    required this.viewModel,
    required this.onPop,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  ScrollController scrollControllerLists = ScrollController();

  void _showSnackBar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    widget.viewModel.readAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.showSnackBar = (message) => _showSnackBar(context, message);
    return WillPopScope(
      onWillPop: widget.onPop,
      child: Scaffold(
        body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              controller: scrollControllerLists,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  //scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          widget.viewModel.postId = widget.viewModel.listingsList[index].postId;
                          widget.viewModel.selectedListingIndex = index;
                          widget.viewModel.homeNavigationState = HomePageNavigationState.detailListPage;
                          /*widget.viewModel.updatesNavigationState = UpdatesPageNavigationState.postDetailsPage;*/
                        },
                        child: HomeListingCard(model: widget.viewModel.listingsList[index]));///PostCard(postModel: widget.viewModel.postsList[index]));
                  },
                  itemCount: widget.viewModel.listingsList.length,
                )
              ],
            )
        ),
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
