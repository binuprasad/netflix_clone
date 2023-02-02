import 'package:flutter/material.dart';
import 'package:netflix/presentation/fast_and_laugh/widget/video_list_item..dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) {
          return VideoListItem(
            index: index,
          );
        }),
      )),
    );
  }
}
