import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngaos_app/bloc/ayat/ayat_bloc.dart';
import 'package:ngaos_app/bloc/bloc.dart';
import 'package:ngaos_app/data/model/response_detail_surah.dart';
import 'package:ngaos_app/data/model/response_surah.dart';
import 'package:ngaos_app/screen/widget/box.dart';

class SurahDetailPage extends StatefulWidget {
  final String number;
  final Datum datum;
  const SurahDetailPage({super.key, required this.number, required this.datum});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  late AyatBloc _ayatBloc = AyatBloc();
  Brightness _brightness = Brightness.dark;
  List<Data> list = [];

  final ScrollController _scrollController = ScrollController();
  int _ayat = 1;
  bool _isLoading = false;

  @override
  void initState() {
    _ayatBloc.add(AyatEventAyatGet(int.parse(widget.number), _ayat,
        int.parse(widget.datum.numberOfVerses)));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _ayat++;
        _fetchData(_ayat);
      }
    });
    super.initState();
  }

  void _fetchData(int ayat) {
    print("ayat -> $ayat");
    _ayatBloc.add(AyatEventAyatGet(int.parse(widget.number), ayat,
        int.parse(widget.datum.numberOfVerses)));
  }

  @override
  Widget build(BuildContext context) {
    _brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: _appBar(),
      body: _content(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(widget.datum.nameId),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          (widget.number != "1" && widget.number != "9")
              ? Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        "assets/svgs/basmalah.svg",
                        colorFilter: ColorFilter.mode(
                          _brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )
              : const SizedBox(),
          BlocBuilder<AyatBloc, AyatState>(
            bloc: _ayatBloc,
            builder: (context, state) {
              if (state is AyatStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AyatStateDetailSuccess) {
                list = state.list;

                return ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Data data = list[index];
                    return DetailSurahItemCard(
                      juz: data.juz,
                      ayat: data.ayah,
                      arab: data.arab,
                      latin: data.latin,
                      indonesia: data.text,
                      audio: data.audio,
                    );
                  },
                );
              } else if (state is AyatStateFailed) {
                return Center(
                  child: Text('Failed to load data: ${state.error}'),
                );
              } else {
                return const Center(
                  child: Text('Unknown error occurred'),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _ayatItem({required Data ayat}) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(27 / 2)),
                    child: Center(
                      child: Text(
                        ayat.ayah,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              ayat.arab,
              style: const TextStyle(
                fontFamily: "Lpmq",
                fontSize: 18,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              ayat.latin,
            )
          ],
        ),
      );

  @override
  void dispose() {
    _ayatBloc.close();
    super.dispose();
  }
}
