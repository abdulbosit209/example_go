import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/tabs_cubit/tabs_cubit.dart';

import 'order_page/order_page.dart';
import 'settings_page/settings_page.dart';


@RoutePage()
class TabBox extends StatelessWidget {
  const TabBox({super.key});

  final List<Widget> screens = const [OrderPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabsCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<TabsCubit, TabsState>(
          builder: (context, state) {
            return Stack(
              children: [
                IndexedStack(
                  index: state.currentPage,
                  children: screens,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: state.currentPage,
                      onTap: (value) {
                        context.read<TabsCubit>().changeTabState(value);
                      },
                      items:const [
                        BottomNavigationBarItem(
                          activeIcon: Icon(Icons.directions_car_sharp,color: Colors.white, size: 35,),
                          icon: Icon(Icons.directions_car_sharp),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          activeIcon: Icon(Icons.settings_sharp,color: Colors.white, size: 35),
                          icon: Icon(Icons.settings),
                          label: '',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
