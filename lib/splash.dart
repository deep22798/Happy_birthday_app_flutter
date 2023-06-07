import 'dart:async';

import 'package:akku_hbd/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin {

  AnimationController? animationController;
  AudioPlayer player = AudioPlayer();
   playSampleSound() {
    player.setAsset('assets/images/hbd.mp3');
    player.play();
  }
   playSampleSoun() {
    player.setAsset('assets/images/hbd.mp3');
    player.stop();
  }
  @override
  void initState() {
    super.initState();
    playSampleSound();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 12),
    );
    animationController!.repeat();

    // Timer(
    //     Duration(seconds: 10),
    //         () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => homescreen())));
    //

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [


          Align(alignment: Alignment.topLeft,
              child: Lottie.asset("assets/images/conf.json",)),
            Align(alignment: Alignment.topRight,
                          child: Lottie.asset("assets/images/conf.json",)),

           Align(alignment: Alignment.topCenter,
                                    child: Lottie.asset("assets/images/conf.json",)),
Align(alignment: Alignment.bottomCenter,
              child: Lottie.asset("assets/images/conf.json",)),
            Align(alignment: Alignment.bottomRight,
                          child: Lottie.asset("assets/images/conf.json",)),

           Align(alignment: Alignment.bottomLeft,
                                    child: Lottie.asset("assets/images/conf.json",)),



          Center(child:
          Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RotationTransition(
                  child: Container(height: 200,width: 200,color: Colors.white,child: Image.asset("assets/images/one.png"),),
                turns:animationController!,
              ),
              Lottie.asset("assets/images/hbd.json",)
            ],
          ),

          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(alignment: Alignment.bottomCenter,
              child: MaterialButton(onPressed: (){
                setState(() {
                  playSampleSoun();
                });
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homescreen()));
              },
                  child:Text("Next",style: TextStyle(color: Colors.white),),
                color: Colors.pink,
              ),
            ),
          ),
        ],
      )
    );
  }
}
