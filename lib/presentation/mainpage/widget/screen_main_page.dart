import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/New&Hot/screen_new_and_hot.dart';

import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_and_laugh/screen_fast_and_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/mainpage/widget/bottom_navigation.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({Key? key}) : super(key: key);
  final _pages=[
const ScreenHome(),
const NewAndHot(),
const FastLaugh(),
const Search(),
 ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body:ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (BuildContext context, int index, Widget? child) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
