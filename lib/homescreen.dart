import 'package:akku_hbd/gift.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  AudioPlayer player = AudioPlayer();
  playSampleSound() {
    player.setAsset('assets/images/hbd2.mp3');
    player.play();
  }  playSampleSoun() {
    player.setAsset('assets/images/hbd2.mp3');
    player.stop();
  }
  // AudioPlayer player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playSampleSound();
    // player.stop();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Stop Celebrate',style: TextStyle(color: Colors.black,fontSize: 30),),
        content: Text('Do you want to Stop Celebrate?',style: TextStyle(color: Colors.black,fontSize: 20),),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child:Text('Yes'),
          ),
        ],
      ),
    )??false;
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            Container(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/akku.png"),fit: BoxFit.cover
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.bottomCenter,
                child: MaterialButton(onPressed: (){
                  setState(() {
                    playSampleSoun();
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>gift()));

                },color: Colors.orange ,
                  child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20),),),
              ),
            )
          ],
        )
      ),
    );
  }
}
