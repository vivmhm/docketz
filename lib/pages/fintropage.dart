import 'package:docketz/pages/shomepage.dart';
import 'package:docketz/pages/tlineups.dart';
import 'package:docketz/widgets.dart';
import 'package:docketz/widgets2.dart';
import 'package:flutter/material.dart';

class FIntropage extends StatefulWidget {
  @override
  _FIntropageState createState() => _FIntropageState();
}

class _FIntropageState extends State<FIntropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 25.0,
        ),
          color: Color(0xFFFFFF),
          child: Stack(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DockWidget(),
                Container(
                  margin: EdgeInsets.only(
                    top: 1.0,
                    bottom: 240.0,
                  ),
                  child: Image(
                  image: AssetImage(
                    'assets/images/intrologo.png'
                  ),
                ),
                ),
               // DockWidget2(),
              ],
        ),
              Positioned(
                bottom: 40.0,
                right:100.0,
                child: GestureDetector(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SHomepage()
                        ),
                        );
                    },
                  child: Container(
                    width: 110.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color:Color(0xFF25282B),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text ("Start Here",
                      style: TextStyle(
                        color: Color(0xFF24B5E2),
                        height: 2.5,
                        fontSize: 25.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w100,),)
        ),
                ),
       )
      ],
     ),
    ),
   ),
  );
 }
}
