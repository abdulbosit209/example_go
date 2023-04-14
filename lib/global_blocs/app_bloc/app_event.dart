part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppLogOutRequested extends AppEvent {
  const AppLogOutRequested();
}

class _AppUserChanged extends AppEvent {
  const _AppUserChanged( this.user);

  final User user;
}
