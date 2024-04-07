import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ngaos_app/screen/widget/themes.dart';

class LastReadCard extends StatelessWidget {
  const LastReadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -20,
            child: SvgPicture.asset(
              "assets/svgs/book.svg",
              height: 85,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/icon_book.svg",
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.background,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Last Read",
                      style: TextStyle(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Al-fatihah",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Ayat no: 4',
                  style: TextStyle(fontWeight: regular),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SurahItemCard extends StatelessWidget {
  final String surah;
  final String nomor;
  final String diturunkan;
  final String ayat;
  final String arabic;
  final VoidCallback? onPressed;
  const SurahItemCard({
    super.key,
    required this.surah,
    required this.diturunkan,
    required this.ayat,
    required this.arabic,
    required this.nomor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/icon_border.svg",
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Center(
                            child: Text(
                              nomor,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          surah,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "$diturunkan | $ayat Ayat",
                          style: TextStyle(fontSize: 12, fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  arabic,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: semiBold,
                    fontFamily: "Lpmq",
                  ),
                )
              ],
            ),
            const Spacer(),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}

class DetailSurahItemCard extends StatefulWidget {
  final String juz;
  final String ayat;
  final String arab;
  final String latin;
  final String indonesia;
  final String audio;
  const DetailSurahItemCard({
    super.key,
    required this.juz,
    required this.ayat,
    required this.arab,
    required this.latin,
    required this.indonesia,
    required this.audio,
  });

  @override
  State<DetailSurahItemCard> createState() => _DetailSurahItemCardState();
}

class _DetailSurahItemCardState extends State<DetailSurahItemCard> {
  Brightness _brightness = Brightness.dark;
  AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    super.initState();
  }

  Future<void> playAudio() async {
    await _audioPlayer.setUrl(widget.audio);
    _audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    _brightness = MediaQuery.of(context).platformBrightness;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.arab,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Lpmq',
              fontSize: 22,
              fontWeight: semiBold,
              wordSpacing: 1,
              height: 2.5,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(widget.latin),
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.indonesia,
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: _brightness == Brightness.dark
                          ? Colors.grey.shade100
                          : Colors.grey.shade900,
                    ),
                  ),
                  child: Text("${widget.juz} : ${widget.ayat}"),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                      ),
                    ),
                    ControlButtonAudio(
                        audio: widget.audio, player: _audioPlayer),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline_rounded,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ControlButtonAudio extends StatelessWidget {
  final AudioPlayer player;
  final String audio;
  const ControlButtonAudio({
    super.key,
    required this.audio,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    Brightness _brightness = MediaQuery.of(context).platformBrightness;
    player.setUrl(audio);
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 24.0,
            height: 24.0,
            child: CircularProgressIndicator(
              color: _brightness == Brightness.dark
                  ? Colors.grey.shade100
                  : Colors.grey.shade900,
            ),
          );
        } else if (playing != true) {
          return IconButton(
            icon: const Icon(Icons.play_arrow_outlined),
            onPressed: player.play,
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            icon: const Icon(Icons.pause_outlined),
            onPressed: player.pause,
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.play_arrow_outlined),
            onPressed: () => player.seek(Duration.zero),
          );
        }
      },
    );
  }
}
