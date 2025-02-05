import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(WrestlingApp());
}

class WrestlingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WrestlingVideoScreen(),
    );
  }
}

class WrestlingVideoScreen extends StatefulWidget {
  @override
  _WrestlingVideoScreenState createState() => _WrestlingVideoScreenState();
}

class _WrestlingVideoScreenState extends State<WrestlingVideoScreen> {
  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=37xDtAOrvfY', // Ivelisse vs Chelsea Green - Ladies Night Out
    'https://www.youtube.com/watch?v=AUaOAz5Y4NY', // Ivelisse "La Sicaria" vs Chelsea Green "Hot Mess"
    'https://www.youtube.com/watch?v=DAd07H2IIZs', // Money Birds vs Spark The World
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          String videoId = YoutubePlayer.convertUrlToId(videoUrls[index])!;
          return YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
            builder: (context, player) {
              return Container(
                color: Colors.black,
                child: Center(
                  child: player,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
