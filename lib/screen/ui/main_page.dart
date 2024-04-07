import 'package:flutter/material.dart';
import 'package:ngaos_app/screen/ui/menu/bookmark_page.dart';
import 'package:ngaos_app/screen/ui/menu/home_page.dart';
import 'package:ngaos_app/screen/ui/menu/salat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: bottomNav(),
      body: menuItem(),
    );
  }

  Widget bottomNav() {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      clipBehavior: Clip.antiAlias,
      child: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
        ],
      ),
    );
  }

  Widget menuItem() {
    return <Widget>[
      HomePage(),
      SalatPage(),
      BookmarkPage(),
    ][_currentIndex];
  }
}
