part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitialState extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsLoadedState extends NotificationsState {}

class NotificationsErrorState extends NotificationsState {
  final String errorMsg;

  const NotificationsErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
