import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/data/local_storage/local_storage.dart';
import 'package:gotaxi/global_blocs/app_bloc/view/app.dart';
import 'package:gotaxi/global_blocs/bloc_observer.dart';

import 'data/repositories/authentification_reository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await StorageRepository.getInstance();
  Bloc.observer = const AppBlocObserver();


  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}

