import 'package:flutter/material.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/screens/video_play_screen.dart';

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
      padding:
          EdgeInsets.only(bottom: myMargem, left: myMargem, right: myMargem),
      child: SizedBox(
        height: screenHeight * 0.1275,
        child: Row(children: [
          Stack(alignment: Alignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
              child: Image.asset(
                image,
                width: screenHeight * 0.23,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VideoPlayerScreen(videoId: videoId)));
                },
                icon: Icon(
                  Icons.play_circle_fill,
                  size: screenHeight * 0.055,
                  color: myTransparentWhite,
                )),
          ]),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: myMargem),
            child: Text(
              titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.045,
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
