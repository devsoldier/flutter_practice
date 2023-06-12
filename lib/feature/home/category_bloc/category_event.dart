part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategoryData extends CategoryEvent {
  final String? categoryName;

  const LoadCategoryData({this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}

class CategoryErrorEvent extends CategoryEvent {}
