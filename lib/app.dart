import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_connect_tz/bloc/description/description_bloc.dart';
import 'package:pro_connect_tz/bloc/main/main_bloc.dart';
import 'package:pro_connect_tz/bloc/navigation/navigation_bloc.dart';
import 'package:pro_connect_tz/presentatsia/screens/home_screen.dart';

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MainBloc()),
        BlocProvider(create: (context)=>NavigationBloc()),
        BlocProvider(create: (context)=>DescriptionBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true,),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}