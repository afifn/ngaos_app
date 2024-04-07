import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngaos_app/bloc/bloc.dart';
import 'package:ngaos_app/data/model/response_surah.dart';
import 'package:ngaos_app/routes/router.dart';
import 'package:ngaos_app/screen/widget/box.dart';

class SuratTab extends StatefulWidget {
  const SuratTab({super.key});

  @override
  State<SuratTab> createState() => _SuratTabState();
}

class _SuratTabState extends State<SuratTab> {
  @override
  void initState() {
    context.read<SurahBloc>().add(SurahEventGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SurahBloc surahBloc = BlocProvider.of(context);
    return StreamBuilder<Object>(
      stream: surahBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("error ${snapshot.error.toString()}"),
          );
        } else if (snapshot.hasData && snapshot.data is SurahStateSuccess) {
          List<Datum> list = [];
          final item = snapshot.data as SurahStateSuccess;
          list = item.list;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Datum data = list[index];
              return SurahItemCard(
                surah: data.nameId,
                diturunkan: data.revelationId,
                ayat: data.numberOfVerses,
                arabic: data.nameShort,
                nomor: data.number,
                onPressed: () {
                  setState(() {
                    context.goNamed(
                      RouterName.surahDetail,
                      pathParameters: {
                        "number": data.number,
                      },
                      extra: data,
                    );
                  });
                },
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
