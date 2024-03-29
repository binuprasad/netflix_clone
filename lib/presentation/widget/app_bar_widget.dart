import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

final String title;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
     Text(title,style: GoogleFonts.montserrat(fontSize: 30,fontWeight: FontWeight.w900),),
     const Spacer(),
      const Icon(Icons.cast,color: Colors.white,size: 30,),
      kwidth,
      Container(height: 30,width: 30, color: Colors.blue,),
      kwidth,
    
    ],);
  }
}