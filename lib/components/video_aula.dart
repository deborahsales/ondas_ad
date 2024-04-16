import 'package:flutter/material.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/screens/video_play.dart';

class VideoAula extends StatelessWidget {
  final String image;
  final String titulo;
  final String videoId;

  const VideoAula(
      {super.key,
      required this.image,
      required this.titulo,
      required this.videoId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: myMargem, left: myMargem, bottom: myMargem, right: myMargem),
      child: SizedBox(
        height: 100,
        child: Row(children: [
          Stack(alignment: Alignment.center, children: [
            Image.asset(
              image,
              width: 180,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerScreen(videoId: videoId)));
                },
                icon: const Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                )),
          ]),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: myMargem),
            child: Text(
              titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ))
        ]),
      ),
    );
  }
}
