import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/widgets/empty_image.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key ,required this.contact , required this.onDeletePress});
  final Contact contact ;
  final VoidCallback onDeletePress;



  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Stack
            (
            alignment: AlignmentGeometry.bottomLeft,
            children: [
              contact.image==null ? EmptyImage()
               : ClipRRect( borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(16) , topRight: Radius.circular(16) ),
                  child: Image.file( File(contact.image!.path ), width: double.infinity, fit: .cover, )) ,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3 ,vertical: 8),
                child: Container(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 5 , horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(8) ,
                    color: Color(0xFFFFF1D4) ,
                  ),
                  child: Text(contact.name ,style: TextStyle(
                      fontSize: 20 ,
                      fontWeight: .w500
                  ),),
                ),
              )],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16) , bottomRight: Radius.circular(16)) ,
              color: Color(0xFFFFF1D4) ,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                     Icon(Icons.email) ,
                      SizedBox(width: 5,),
                      Text(contact.email,
                        style: TextStyle(
                        fontSize: 16 ,
                        fontWeight: .w500
                      ),),
                    ],),
                  ),
                  Row(children: [
                    Icon(Icons.phone_in_talk_sharp) ,
                    SizedBox(width: 5,),
                    Text(contact.phone , style: TextStyle(
                        fontSize: 16 ,
                        fontWeight: .w500
                    ),),
                  ],),
                  ElevatedButton(style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.red ,
                    foregroundColor: Colors.white ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8))
                  ) ,
                      onPressed: onDeletePress,
                      child: Row(
                        spacing: 6,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete),
                          Text("Delete" ,style: TextStyle(
                              fontSize: 18 ,
                              fontWeight: .w500),)
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
