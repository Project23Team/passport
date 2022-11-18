import 'package:flutter/material.dart';
import 'package:myapp/classes/language.dart';
import 'package:myapp/classes/language_constants.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/signup/view.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool chick = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        //title: Text(translation(context).homePage),
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
      backgroundColor: Color(0xff06283D),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child:
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:1,
            itemBuilder: (BuildContext context, int i) {
              return
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80,bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child:GestureDetector(
                          child:Row(
                            children: [
                              Icon(Icons.arrow_drop_down,color: Colors.white,),
                              Container(
                                  height: 60, width: 250,
                                  child: Center(child: Text(translation(context).ifYouHaveNotAccount,style: TextStyle(fontSize: 17,color: Color(0xffffffff)),))),

                            ],
                          ),

                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => signup()));
                            });
                          }

                      ),

                    ),
                    SizedBox(height: 20,),
                      TextField(
                        maxLength: 15,
                       // textAlign: TextAlign.right,
                        cursorColor: Color(0xffffffff),
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                          fillColor: Colors.grey.withOpacity(0.3), filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                          hintText: translation(context).name,


                        ),
                      ),


                    SizedBox(height: 20,),
                    TextField(
                        maxLength: 11,
                        //textAlign: TextAlign.right,
                        cursorColor: Color(0xffffffff),
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Colors.white,fontSize: 12,),
                          fillColor: Colors.grey.withOpacity(0.3), filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                          hintText: translation(context).phoneNumber,


                        ),
                      ),


                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:GestureDetector(
                          child:   Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_drop_down),
                              Container(
                                  height: 60, width: 250,
                                  child: Center(child: Text(translation(context).ifSharingIcon,style: TextStyle(fontSize: 17,color: Color(0xffffffff)),))),                            ],
                          ),

                          onTap: () {
                            setState(() {
                              chick =! chick;
                            });
                          }

                      ),

                    ),

                    Visibility(
                      visible: chick,
                      child:
                        TextField(
                          //textAlign: TextAlign.right,
                          cursorColor: Color(0xffffffff),
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color:Color(0xffffffff),fontSize: 12,),
                            fillColor: Colors.grey.withOpacity(0.3), filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),

                            hintText: translation(context).sharingIcon,


                          ),
                        ),
                    ),


                    SizedBox(height: 40,),
                    SizedBox(
                      width:MediaQuery.of(context).size.width,
                      height: 50 ,// <-- match-parent
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home()));
                          setState(() {

                          });

                        },
                        child: Text(translation(context).next,style: TextStyle(fontSize: 20,color: Color(0xff04a794)),),
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Color(0xffffffff),
                            // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                            side: BorderSide(
                              width: 0,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20,)
                            )),

                      ),
                    )






                  ],
                );
            },
          ),

        ),
      ),


    );
  }
}