import 'package:go_router/go_router.dart';
import 'package:ngaos_app/data/model/response_surah.dart';
import 'package:ngaos_app/screen/ui/main_page.dart';
import 'package:ngaos_app/screen/ui/splash_page.dart';
import 'package:ngaos_app/screen/ui/tab/surah/surah_detail_page.dart';

part 'router_name.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: RouterName.splashPage,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/main",
      name: RouterName.mainPage,
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: ":number/surah",
          name: RouterName.surahDetail,
          builder: (context, state) {
            return SurahDetailPage(
              number: state.pathParameters["number"]!,
              datum: state.extra as Datum,
            );
          },
        )
      ],
    ),
  ],
);
