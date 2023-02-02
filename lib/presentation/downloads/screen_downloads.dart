import 'dart:math';


import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/colors/constants.dart';
import 'package:netflix/presentation/widget/app_bar_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ScreenDownloads extends StatelessWidget {
   ScreenDownloads({Key? key}) : super(key: key);
   
  final _widgetList=[
    const _SmartDownloads(),
    Section2(),
    const Section3()
  ];
 

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 25,);
        },
        itemBuilder: (BuildContext context, int index) {
          return _widgetList[index];
        },
      ),
    );
  }
}
class Section2 extends StatefulWidget {
  Section2({Key? key}) : super(key: key);

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
   final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ekZobS8isE6mA53RAiGDG93hBxL.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg",
  ];

  List trendingMovies=[

  ];

  final String apikey='https://api.themoviedb.org/3/movie/550?api_key=e89a5b6bf18b653de01e523b5ce651cf';

  final readacesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlODlhNWI2YmYxOGI2NTNkZTAxZTUyM2I1Y2U2NTFjZiIsInN1YiI6IjYzMDQ3YTZiZGZlMzFkMDA3YjgzNDA5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fl2bXvn9wK7OH3YOh83CWl4ZYY1mwBQskl8yJ7LoaCg';

  @override
  void initState() {
    loadmovies();
   
    
  }

  loadmovies()async{
    TMDB tmdbWithCustomLogs =TMDB(ApiKeys(apikey,readacesstoken),logConfig: ConfigLogger(showLogs: true,showErrorLogs: true));
    Map trendingresult= await tmdbWithCustomLogs.v3.trending.getTrending();
    setState(() {
      trendingMovies = trendingresult['results'];
    });
    print(trendingresult);

   

  }

  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return Column(children: [
       const Text(
            'Indraducing Downloads for you',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kwhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          kheight,
          const Text(
            "we will download a personalised selection of\nmovies and shows for you there's\nalways something watch on your device",
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          kheight,
          SizedBox(
            width: size.width,
            height: size.width,
            
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.6),
                  radius: size.width * 0.4,
                ),
                downloadsimagewidget(
                  imageList: imageList[0],
                  margin: const EdgeInsets.only(left: 170,top: 50),
                  angle: 20,
                  size: Size(size.width * 0.35, size.width * 0.55),
                ),
                downloadsimagewidget(
                  imageList: 'https://image.tmdb.org/t/p/w500'+Trending[index]['poster_path'],
                  margin: const EdgeInsets.only(right: 170,top: 50),
                  angle: -20,
                  size: Size(size.width * 0.35, size.width * 0.55),
                ),
                downloadsimagewidget(
                  imageList: imageList[2],
                  margin: const EdgeInsets.only(bottom: 35,top: 50),
                  size: Size(size.width * 0.4, size.width * 0.6),
                  radius: 10,
                )
              ],
            ),
          ),
    ],);
  }
}
class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: MaterialButton(
              color: kbuttoncolor,
              onPressed: () {},
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set up',
                  style: TextStyle(
                      color: kbuttoncolorwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
      ),
      kheight,
          MaterialButton(
            color: kbuttoncolorwhite,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See what you can download',
                style: TextStyle(
                    color: kblackcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

    ],);
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        Text(' Smart Downloads')
      ],
    );
  }
}

class downloadsimagewidget extends StatelessWidget {
  const downloadsimagewidget(
      {Key? key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(image: NetworkImage(imageList),fit: BoxFit.fill)),
          ),
        ),
      ),
    );
  }
}
