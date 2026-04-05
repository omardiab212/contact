import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey ,
        borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(16) , topRight: Radius.circular(16) ),
      )
      , child: Center(child: Icon(Icons.person , color: Colors.white, size:200,) ,),);
  }
}
