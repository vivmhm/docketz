import 'package:flutter/material.dart';

class DockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
        horizontal: 120.0,
        vertical: 30.0,
        ),
      //color: Colors.blue,
      child: Text("Docketz",
      style: TextStyle(
      color: Color(0xFF24B5E2),
      height: 1.5,
      fontSize: 21.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w100,),

    )
    );
  }
}
