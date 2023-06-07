import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

class music extends StatefulWidget {
  const music({Key? key}) : super(key: key);

  @override
  State<music> createState() => _musicState();
}

class _musicState extends State<music> with SingleTickerProviderStateMixin{

  bool isimage=false;
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
            onPressed: () {
              playSampleSoun();
              Navigator.of(context).pop(true);
            } ,
            child:Text('Yes'),
          ),
        ],
      ),
    )??false;
  }
  AnimationController? animationController;
  AudioPlayer player = AudioPlayer();
  playSampleSound() {
    player.setAsset('assets/images/musi.mp3');
    player.play();
    setState(() {
      iss=true;
    });
  }  playSampleSoun() {

    player.setAsset('assets/images/musi.mp3');
    player.stop();
    setState(() {
      iss=false;

    });
  }
  @override
  void initState() {
    super.initState();
    playSampleSound();
    setState(() {
      iss;
    });
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

  bool iss=false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,shadowColor: Colors.transparent,
          title: Center(child: Text("Meri Fati Awaz",style: TextStyle(fontSize: 18,color: Colors.pink),)),),
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotationTransition(
                    child: Container(height: 200,width: 200,color: Colors.white,child: Image.asset("assets/images/musi.png"),),
                    turns:animationController!,
                  ),
                  Lottie.asset("assets/images/gui.json",)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(child: iss==true ? InkWell(
                  onTap: (){
                    playSampleSoun();
                  },
                    child: Icon(Icons.pause_circle,size: 50,color: Colors.pink,)): InkWell(
                    onTap: (){playSampleSound();},
                    child: Icon(Icons.play_circle,size: 50,color: Colors.pink,))),
              ),
              // Icon(Icons.stop,size: 50,color: Colors.pink,)

            ],
          ),

        ),
      ),
    );
  }
}
