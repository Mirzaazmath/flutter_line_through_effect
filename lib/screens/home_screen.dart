import 'package:flutter/material.dart';

import '../components/painter_component.dart';
import '../utils/text_utils.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myText="ILoveFlutter";

  @override

// listofletter IS A METHOD THAT RETURN LIST OF WIDGETS
  List<Widget> listofletter( bool isupperline){
    // EMPTY WIDGET LIST
    List<Widget>widetlist=[];
    // CREATING LIST OF STRING WITH split() FROM myText STRING
    var list=myText.split("");
    // LOOP
    for(int i=0;i<list.length;i++){
      // ADDING THE WIDGETS IN WIDGET LIST
      widetlist.add(TextWidget(list[i], isupperline,i));}
    // RETURNING THE WIDGET LIST
    return widetlist;
  }

  Widget build(BuildContext context) {
    debugPrint("Rebuild");

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      // USING STACK FOR DESIGN
      body: Stack(
        children: [
          // LOWER LAYER
          Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // LIST OF  TEXT WIDGETS WITH BOOL VALUE TO INDICATE WEATHER THE ROW IS FROM LOWER LAYER OR UPPER LAYER
              children:listofletter(false),
            ),
          ),
          // LINE
          Padding(
            padding: const EdgeInsets.only(top: 3),
            // USING THE TweenAnimationBuilder TO ANIMATE THE LINE
            child: TweenAnimationBuilder(
              // HERE WE ARE DEFINING THE LINE TWEEN WITH
              // BEGIN =0;
              // END = TOTAL SCREEN WIDTH
                tween: Tween<double>(begin: 0,end:MediaQuery.of(context).size.width ),
                // SETTING THE DURATION FOR ANIMATION
                duration: const  Duration(seconds: 8),
                // BUILDER  builder: (CONTEXT, DOUBLE ,WIDGET)
                builder: (context, value,child) {
                  // RETURNING THE CustomPaint WIDGET
                  return CustomPaint(
                    painter: LinePainter(
                      // PROVIDING THE SCREEN WIDTH AND HEIGHT
                        screenHeight: MediaQuery.of(context).size.height,
                        screenWidth:value
                    ),

                  );
                }
            ),
          ),
          // UPPER LAYER
          Center(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // LIST OF  TEXT WIDGETS WITH BOOL VALUE TO INDICATE WEATHER THE ROW IS FROM LOWER LAYER OR UPPER LAYER
              children:listofletter(true),
            ),
          ),
        ],
      ),
    );
  }
}