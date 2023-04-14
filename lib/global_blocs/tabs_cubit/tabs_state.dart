part of 'tabs_cubit.dart';

class TabsState extends Equatable {
  const TabsState({required this.currentPage});

  final int currentPage;

  TabsState copyWith({
    int? currentPage,
  }) =>
      TabsState(
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [currentPage];
}
