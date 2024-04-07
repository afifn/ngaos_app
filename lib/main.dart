import 'package:flutter/material.dart';
import 'package:ngaos_app/bloc/ayat/ayat_bloc.dart';
import 'package:ngaos_app/screen/widget/themes.dart';

import 'bloc/bloc.dart';
import 'routes/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahBloc(),
        ),
        BlocProvider(
          create: (context) => AyatBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Ngaos",
        routerConfig: router,
        theme: lightMode,
        darkTheme: darkMode,
      ),
    );
  }
}
