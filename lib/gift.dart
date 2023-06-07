import 'package:akku_hbd/music.dart';
import 'package:akku_hbd/song.dart';
import 'package:flutter/material.dart';
class gift extends StatefulWidget {
  const gift({Key? key}) : super(key: key);

  @override
  State<gift> createState() => _giftState();
}

class _giftState extends State<gift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GridView.count(shrinkWrap: true,
          // primary: false,
          padding:  EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(child: Stack(
                    children: [
                      Center(child: Container(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/h.png"))),

                      )),
                      InkWell(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>music()));
                      },
                          child: Center(child: Icon(Icons.play_circle,size: 100,color: Colors.white,)))

                    ],
                  )),
                  // SizedBox(height: 20,),
                 MaterialButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>music()));
                          },
                          child: const Text('Play',style: TextStyle(color: Colors.white,fontSize: 18),),color: Colors.pink,),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(child: Stack(
                    children: [
                      Center(child: Container(
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/vid.jpeg"))),

                      )),
                      InkWell(onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp()));
                      },
                          child: Center(child: Icon(Icons.play_circle,size: 100,color: Colors.white,)))

                    ],
                  )),
                  SizedBox(height: 20,),
                  InkWell(
                      child: const Text('🎂🍰🧁🥳🙌🎈🎉🎊🎁👑💐🌷😘'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoApp()));
                    },

                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
