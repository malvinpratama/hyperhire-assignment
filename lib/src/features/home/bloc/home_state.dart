part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ViewStatusModel viewStatusModel;
  final List<String> bannerList;
  final int bannerIndex;
  final List<Product> productList;
  final List<User> userList;

  const HomeState({
    this.viewStatusModel = ViewStatusModel.idle,
    this.bannerList = const <String>[],
    this.bannerIndex = 0,
    this.productList = const <Product>[],
    this.userList = const <User>[],
  });

  HomeState copyWith({
    ViewStatusModel? viewStatusModel,
    List<String>? bannerList,
    int? bannerIndex,
    List<Product>? productList,
    List<User>? userList,
  }) {
    return HomeState(
      viewStatusModel: viewStatusModel ?? this.viewStatusModel,
      bannerList: bannerList ?? this.bannerList,
      bannerIndex: bannerIndex ?? this.bannerIndex,
      productList: productList ?? this.productList,
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [
        viewStatusModel,
        bannerList,
        bannerIndex,
        productList,
        userList,
      ];
}
