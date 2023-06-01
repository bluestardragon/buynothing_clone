part of 'home_page_view_model_shared.dart';

mixin HomePageViewModel on HomePageViewModelShared {
  ListingsFilterModel selectedFiltersForPost = ListingsFilterModel(pageNumber: 1, totalPerPage: 10);
  List<ListingModelResponse> listingsList = [];
  String postId = '';
  int maxPostsNum = 0;
  int selectedListingIndex = -1;

  /// Function called to scroll on the NextPage
  Future scrollNextPageLists() async {
    print('I am here');
    if (!showPageLoader) {
      showPageLoader = true;
      notifyListeners();
      /*int pageNum = 1;
      pageNum += selectedFiltersForPost.pageNumber ?? 1;
      PostsFilterModel filterModel = PostsFilterModel(pageNumber: pageNum, totalPerPage: selectedFiltersForPost.totalPerPage);
      await updatePosts(filterModel: filterModel, addPosts: true);*/
      showPageLoader = false;
      notifyListeners();
    }
  }

  Future readAllPosts({ListingsFilterModel? filterModel, bool addPosts = false}) async {
    FirebaseDatabase.instance.ref("listings").onChildAdded.listen((event) {
      print("OnChildAdded: ${event.snapshot.key}");
      listingsList.add(ListingModelResponse.fromSnapshot(event.snapshot));
      notifyListeners();
      //;
    });
    FirebaseDatabase.instance.ref("listings").onChildChanged.listen((event) {
      print("OnChildChanged: ${event.snapshot.key}");
    });
    FirebaseDatabase.instance.ref("listings").onChildRemoved.listen((event) {

    });
    /*
    try {
      if (filterModel != null) selectedFiltersForPost = filterModel;
        showPageLoader = true;
        await homePageRepository.getPosts(selectedFiltersForPost).then((postsDetail) {
        maxPostsNum = postsDetail.maxElementsNum;
        ///listingsList.addAll(postsDetail.listings);
        listingsList = addPosts ? [...listingsList, ...postsDetail.listings] : postsDetail.listings;
        showPageLoader = false;
        notifyListeners();
      }).catchError((error) {
        showPageLoader = false;
        showSnackBar!(translation.generic.genericError);
        notifyListeners();
      });
    } catch (e) {
      print(e);
      showPageLoader = false;
      notifyListeners();
    }*/
  }
}
