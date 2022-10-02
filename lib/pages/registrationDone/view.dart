import 'package:flutter/material.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
class RegistrationDone extends StatefulWidget {
  const RegistrationDone({Key? key}) : super(key: key);

  @override
  State<RegistrationDone> createState() => _RegistrationDoneState();
}

class _RegistrationDoneState extends State<RegistrationDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: Text(translation(context).homePage),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SizedBox(height: 140,),
                         Text(translation(context).successfullyRegistered,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                        SizedBox(height: 20,),
                         Icon(Icons.check_circle_outline,color: Color(0xff166d42),size: 40,),
                         SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(translation(context).fingerprint,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                         ),
                       ],
                     ),
                    ),
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child:Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,

                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: 10,
                                    offset: Offset(0,7),
                                    color: Colors.black26
                                )
                              ],
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}
