import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngaos_app/screen/ui/tab/ayat.dart';
import 'package:ngaos_app/screen/ui/tab/juz.dart';
import 'package:ngaos_app/screen/ui/tab/surah/surah.dart';
import 'package:ngaos_app/screen/widget/box.dart';
import 'package:ngaos_app/screen/widget/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Brightness _brightness = Brightness.dark;
  @override
  Widget build(BuildContext context) {
    _brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: _appBar(),
      body: DefaultTabController(
        length: 3,
        child: content(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/svgs/menu_drawer.svg",
              colorFilter: ColorFilter.mode(
                _brightness == Brightness.dark
                    ? Colors.grey.shade100
                    : Colors.grey.shade900,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            'Ngaos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: _brightness == Brightness.dark
                  ? Colors.grey[100]
                  : Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _greeting(),
                const SizedBox(height: 24),
                const LastReadCard(),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            elevation: 0,
            primary: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            automaticallyImplyLeading: false,
            shape: Border(
              bottom: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: _tabBar(),
            ),
          ),
        ],
        body: const TabBarView(children: [SuratTab(), AyatTab(), JuzTab()]),
      ),
    );
  }

  Widget _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: TextStyle(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Afif Nor Yusuf",
          style: TextStyle(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      ],
    );
  }

  TabBar _tabBar() {
    return TabBar(
      unselectedLabelColor:
          _brightness == Brightness.dark ? Colors.grey[400] : Colors.grey[800],
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: medium,
      ),
      labelColor:
          _brightness == Brightness.dark ? Colors.grey[100] : Colors.grey[900],
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: semiBold,
      ),
      indicatorColor: Theme.of(context).colorScheme.secondary,
      indicatorWeight: 3,
      tabs: const [
        Tab(
          text: "Surah",
        ),
        Tab(
          text: "Ayat",
        ),
        Tab(text: "Juz"),
      ],
    );
  }
}
