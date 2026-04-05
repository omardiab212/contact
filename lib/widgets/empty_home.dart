
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyHome extends StatelessWidget {
  const EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset("animations/empty_list.json"),
        Text("There is No Contacts Added Here" , style: TextStyle(
            color: Color(0xFFFFF1D4),
            fontSize: 20 ,
            fontWeight: .w500
        ),) ,
      ],
    );
  }
}
