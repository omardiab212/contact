import 'dart:io';
import 'package:contact/utils/form_validators.dart';
import 'package:contact/widgets/contact_info.dart';
import 'package:contact/widgets/empty_home.dart';
import 'package:contact/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'models/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/" ;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TextEditingController _nameController  ;
  late TextEditingController _emailController ;
  late TextEditingController _phoneController ;
  ValueNotifier<File?> imagePicked =  ValueNotifier(null) ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>() ;

  List<Contact>contacts =[] ;


  @override
  void initState() {
    _nameController = TextEditingController() ;
    _emailController = TextEditingController() ;
    _phoneController = TextEditingController() ;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose() ;
    _emailController.dispose() ;
    _phoneController.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: Color(0xFF29384D),
        title: Image.asset("assets/images/branding.png" , width: 117,height: 39,),
      ),

      body: contacts.isEmpty ? EmptyHome() :
      GridView.builder(
        padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: .56,
              crossAxisCount: 2),
          itemCount: contacts.length,
          itemBuilder: (context , index) => ContactInfo(
            contact: contacts[index],
            onDeletePress: (){
              onDeletePress(index) ;
            },
          )
      ),

         floatingActionButton: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           spacing: 12,
           children: [
             if(contacts.isNotEmpty)
             FloatingActionButton(
               backgroundColor: Colors.red,
               foregroundColor: Colors.white,
               onPressed: (){
                 deleteBottom(contacts.length) ;
               } ,
               child: Icon(Icons.delete , size: 30,),
             ),
             if(contacts.length<6)
             FloatingActionButton(
               backgroundColor: Color(0xFFFFF1D4),
               onPressed: (){
                  bottomNavBar() ;
               } ,
               child: Icon(Icons.add , size: 30,),
             ),
           ],
         ),
    );}
  void bottomNavBar(){
    showModalBottomSheet(backgroundColor:Color(0xFF29384D) ,
        context:  context,
        isScrollControlled: true,
        builder:  (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: .min,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(flex: 3,
                    child: InkWell(
                      onTap:() async {
                        final picker = ImagePicker();
                        final image = await picker.pickImage(source: ImageSource.gallery);
                        if(image != null){
                          imagePicked.value = File(image.path) ;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFFF1D4)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: imagePicked,
                          builder: (BuildContext context, image, Widget? child) {
                             return image == null ? LottieBuilder.asset("animations/image_picker.json")
                                 : AspectRatio(
                               aspectRatio: 1,
                               child: ClipRRect(
                                 borderRadius: BorderRadiusGeometry.circular(30),
                                   child: Image.file(image , fit: BoxFit.cover,)),
                             ) ;
                          },),
                      ),
                    ),
                  ),
                  Expanded(flex: 7,
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: .start,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _nameController,
                          builder: (BuildContext context, value, child) {
                            return Text( _nameController.text.isEmpty ? "User Name" : _nameController.text, style: TextStyle(
                                color: Color(0xFFFFF1D4) ,
                                fontSize: 16 ,
                                fontWeight: .w500
                            ),);
                          },) ,
                        Divider(thickness: 2, color:Color(0xFFFFF1D4) ,),
                        ValueListenableBuilder(
                          valueListenable: _emailController,
                          builder: (BuildContext context, value, child) {
                            return Text(_emailController.text.isEmpty ? "example@email.com" : _emailController.text , style: TextStyle(
                                color: Color(0xFFFFF1D4) ,
                                fontSize: 16 ,
                                fontWeight: .w500
                            ),);
                            },) ,
                        Divider(thickness: 2, color:Color(0xFFFFF1D4) ,),
                        ValueListenableBuilder(
                          valueListenable: _phoneController,
                          builder: (BuildContext context, value, child) {
                            return Text(_phoneController.text.isEmpty ? "+200000000000"  : _phoneController.text, style: TextStyle(
                                color: Color(0xFFFFF1D4) ,
                                fontSize: 16 ,
                                fontWeight: .w500
                            ),);
                          },) ,
                      ],
                    ),
                  ),
                ],),
              Column(
                spacing: 16,
                children: [
                Form(
                    key: _formKey,
                    child: Padding(
                  padding:  EdgeInsets.only(top: 20 ,bottom: MediaQuery.viewInsetsOf(context).bottom),
                  child: Column(
                    spacing: 16,
                    children: [
                     TextFormWidget(
                         controller: _nameController,
                         keyboardType: .name,
                         textInputAction: .next,
                         validator:FormValidators.validateName ,
                         hintText: "Enter User Name "),
                      TextFormWidget(
                          controller: _emailController,
                          keyboardType: .emailAddress,
                          textInputAction: .next,
                          validator:FormValidators.validateEmail ,
                          hintText: "Enter User Email "),
                      TextFormWidget(
                          controller: _phoneController,
                          keyboardType: .phone,
                          textInputAction: .done,
                          validator:FormValidators.validatePhone ,
                          hintText: "Enter User Phone "),
                    ],
                  ),
                )),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(60) ,
                      backgroundColor: Color(0xFFFFF1D4) ,
                      foregroundColor: Color(0xFF29384D) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16)
                      )) ,
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        contacts.add(Contact(
                            name: _nameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text ,
                            image: imagePicked.value ,
                        )) ;
                         setState(() {
                         });
                         _formKey.currentState?.reset();
                        imagePicked.value = null;
                        print("image is ----------- > ${imagePicked.value}");
                        Navigator.pop(context) ;
                      }
                    }, child: Text("Enter" , style: TextStyle(
                  fontSize: 20 ,
                  fontWeight: .w400 ,
                ),) ),
              ],),
            ],),
        )
    );
  }
  void deleteBottom(int index){
    contacts.removeLast() ;
    setState(() {

    });
  }
  void onDeletePress(int index){
    contacts.removeAt(index) ;
    setState(() {

    });
  }
}


