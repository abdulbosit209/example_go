import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/data/local_storage/local_storage.dart';
import 'package:gotaxi/data/repositories/authentification_reository.dart';
import 'package:gotaxi/data/repositories/helper_repository.dart';
import 'package:gotaxi/data/repositories/location_repository.dart';
import 'package:gotaxi/data/repositories/order_repository.dart';
import 'package:gotaxi/data/repositories/passenger_repository.dart';
import 'package:gotaxi/global_blocs/app_bloc/app_bloc.dart';
import 'package:gotaxi/global_blocs/image_upload/image_upload_bloc.dart';
import 'package:gotaxi/global_blocs/location_bloc/location_bloc.dart';
import 'package:gotaxi/global_blocs/login_cubit/login_cubit.dart';
import 'package:gotaxi/global_blocs/login_cubit/view/sms_code_form.dart';
import 'package:gotaxi/global_blocs/order_taxi_bloc/order_taxi_bloc.dart';
import 'package:gotaxi/global_blocs/passenger_bloc/passenger_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/home_page.dart';
import 'package:gotaxi/router/router.dart';
import 'package:gotaxi/services/yandex_map_api_servise/api_client.dart';
import 'package:gotaxi/services/yandex_map_api_servise/api_service.dart';

class App extends StatelessWidget {
  App({
    super.key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;


  @override
  Widget build(BuildContext context) {

    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final fireStore = FirebaseFirestore.instance;

    MapApiService mapApiService = MapApiService(mapApiClient: MapApiClient());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PassengerRepository(firestore: fireStore),
        ),
        RepositoryProvider(
          create: (context) => HelperRepository(firebaseStorage: firebaseStorage),
        ),
        RepositoryProvider(
          create: (context) => OrderRepository(fireStore: fireStore),
        ),
        RepositoryProvider(
          create: (context) => LocationRepository(mapApiService: mapApiService),
        ),
        RepositoryProvider.value(value: _authenticationRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => LocationBloc(
              locationRepository: context.read<LocationRepository>()
            ),
          ),
          BlocProvider(
            create: (context) => OrderTaxiBloc(
              orderRepository: context.read<OrderRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => ImageUploadBloc(
              helperRepository: context.read<HelperRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => PassengerBloc(
              passengerRepository: context.read<PassengerRepository>(),
            ) ..add(GetUserData(userId: _authenticationRepository.currentUser.id))
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              _authenticationRepository,
            ),
          ),
        ],
        child:  AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
   const AppView({super.key});

  @override
  Widget build(BuildContext context) {

    final _appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state.status == AppStatus.authenticated) {
       var isDriver =  StorageRepository.getBool('is_driver');
        return  const TabBox();
      } else {
        return const SmsScreenForm();
      }
    });
  }
}
