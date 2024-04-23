import 'package:flutter/material.dart';
import '../screens/podcast_screen.dart';
import 'constants.dart';

class Podcast extends StatelessWidget {
  final String image;
  final String titulo;
  final String podcastLink;

  const Podcast({super.key, required this.image, required this.titulo, required this.podcastLink});

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
              width: 100,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PodcastScreen(image: image, titulo: titulo, podcastLink: podcastLink)));
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
