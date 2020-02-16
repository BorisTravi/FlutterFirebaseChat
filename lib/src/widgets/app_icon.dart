import 'dart:ffi';

import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    
    return Row(
          children: <Widget>[
          Center(child:Image.asset('images/image_01.png', width: 220,),
          widthFactor:1.5,
          )
      ],
    );
  }
}

// Image.asset('images/image_01.png'),   