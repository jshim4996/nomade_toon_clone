import 'package:flutter/material.dart';
import 'package:toon/model/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.ep,
    required this.webtoonId,
  });

  final WebtoonEpisaodModel ep;
  final String webtoonId;

  onButtonTap() async {
    // final url = Uri.parse("https://google.com");
    // await launchUrl(url);
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${ep.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Container(
          // margin: const EdgeInsets.only(bottom: 20),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ep.title,
                  style: const TextStyle(color: Colors.white),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
