import 'package:flutter/material.dart';
import '../screens/podcast_screen.dart';
import 'constants.dart';

class Podcast extends StatelessWidget {
  final String image;
  final String titulo;
  final String podcastLink;

  const Podcast(
      {super.key,
      required this.image,
      required this.titulo,
      required this.podcastLink});

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
                width: screenHeight * 0.1275,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PodcastScreen(
                              image: image,
                              titulo: titulo,
                              podcastLink: podcastLink)));
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
