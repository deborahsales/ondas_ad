import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../components/constants.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  bool _isReady = false;

  void _handlePopInvoked(bool value) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
        isLive: false,
        forceHD: false,
        showLiveFullscreenButton: false,
        hideControls: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _handlePopInvoked,
      child: Scaffold(
        body: Center(
          child: Stack(children: [
            YoutubePlayer(
              thumbnail: const Scaffold(
                  body: Center(child: CircularProgressIndicator())),
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                setState(() {
                  _isReady = true;
                });
                _controller.toggleFullScreenMode();
              },
            ),
            (!_isReady)
                ? const Scaffold(
                    body: Center(child: CircularProgressIndicator()))
                : const Center(),
          ]),
        ),
      ),
    );
  }
}
