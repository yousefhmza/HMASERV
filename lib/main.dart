import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmaserv/core/services/responsive/responsive_service.dart';
import 'package:hmaserv/modules/movies/presentation/cubits/movies/movies_cubit.dart';
import 'package:hmaserv/modules/movies/presentation/cubits/search/search_cubit.dart';

import 'config/navigation/navigation.dart';
import 'config/theme/light_theme.dart';
import 'core/services/bloc_observer.dart';
import 'core/utils/constants.dart';
import 'di_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<MoviesCubit>()),
        BlocProvider(create: (_) => di.sl<SearchCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.instance.setDeviceDimensionsType(context);
    return MaterialApp(
      title: Constants.appName,
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.moviesScreen,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
