import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:ondas_ad/components/constants.dart';
import '../components/show_snackbar.dart';

class PodcastScreen extends StatefulWidget {
  final String image;
  final String titulo;
  final String podcastLink;

  const PodcastScreen(
      {super.key,
      required this.image,
      required this.titulo,
      required this.podcastLink});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  final audioPlayer = AudioPlayer();
  late AudioSession session;
  bool isPlaying = true;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      showSnackBar(
        context: context,
        mensagem: 'A stream error occurred: $e',
      );
    });
    await audioPlayer
        .setAudioSource(AudioSource.uri(Uri.parse(widget.podcastLink)));
  }

  Future<void> _initAudioSession() async {
    session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
  }

  @override
  void initState() {
    audioPlayer.playerStateStream.listen((playerState) {
      setState(() {
        isPlaying = playerState.playing;
      });
    });

    audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        duration = newDuration!;
      });
    });

    audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
    _initAudioSession();

    _init();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: screenWidth * 0.015,
                  blurRadius: screenWidth * 0.02,
                  offset: Offset(0, screenWidth * 0.01),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenHeight * 0.05,
              right: screenHeight * 0.05,
            ),
            child: Text(widget.titulo,
                style: TextStyle(
                  fontSize: screenHeight * 0.029,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenHeight * 0.02,
              right: screenHeight * 0.02,
            ),
            child: Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
              radius: screenHeight * 0.045,
            backgroundColor: myPurple.withOpacity(0.6),
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow, color: myWhite,
                ),
                iconSize: screenHeight * 0.065,
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.play();
                  }
                },
              ),
          ),
        ],
      ),
    );
  }
}
