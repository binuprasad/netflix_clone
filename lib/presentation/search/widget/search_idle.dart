import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';

import 'search_title.dart';

const imageUrl =
    ('https://www.themoviedb.org/t/p/w250_and_h141_face/otyDmwl75oagrC01LpVeegUknuP.jpg');

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextTitle(title: 'Top Searches',),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return kheight20;
            },
            itemBuilder: (BuildContext context, int index) {
              return const TopSearchItemTile();
            },
          ),
        ),
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 65,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(
              color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblackcolor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhitecolor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
