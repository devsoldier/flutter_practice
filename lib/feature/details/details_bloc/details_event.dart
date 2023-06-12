// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadDetailsData extends DetailsEvent {
  final int? mealID;

  const LoadDetailsData({this.mealID});

  @override
  List<Object?> get props => [mealID];
}

class DetailsErrorEvent extends DetailsEvent {}
