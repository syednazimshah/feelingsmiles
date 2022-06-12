import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

loading(){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/smile.jpg",
              alignment: Alignment.center,
            ),
            Column(
              children: [
                Text('Feeling Smiles',
                    style: GoogleFonts.abrilFatface(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ))),
                SizedBox(
                  height: 10,
                ),
                Text('Emotion Recognition for the Visually Impaired',
                    style: GoogleFonts.actor(
                        textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ))),
              ],
            ),
            const SpinKitFadingCircle(
              color: Colors.lightBlueAccent,
              size: 50.0,
            ),
          ],
        ));
  }
