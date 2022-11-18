import 'package:flutter/material.dart';
import 'package:myapp/classes/language.dart';
import 'package:myapp/classes/language_constants.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home/view.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child:Icon(Icons.arrow_back,color: Colors.white,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
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
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:1,
            itemBuilder: (BuildContext context, int i) {
              return
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child:
                        TextField(
                          maxLength: 50,
                          //textAlign: TextAlign.right,
                          cursorColor:Color(0xffffffff),
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                            fillColor: Colors.grey.withOpacity(0.3), filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),

                            hintText: translation(context).name,


                          ),
                        ),
                    ),

                    SizedBox(height: 20,),
                   // Directionality(
                      //textDirection: TextDirection.rtl,
                      //child:
                      TextField(
                        maxLength: 16,
                       // textAlign: TextAlign.right,
                        cursorColor: Color(0xffffffff),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                          fillColor: Colors.grey.withOpacity(0.3), filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                          hintText: translation(context).phoneNumber,


                        ),
                      ),
                    //),

                    SizedBox(height: 20,),
                        TextField(
                          maxLength: 11,
                          //textAlign: TextAlign.right,
                          cursorColor: Color(0xffffffff),
                          style: const TextStyle(color: Color(0xffffffff)),
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                            fillColor: Colors.grey.withOpacity(0.3), filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),

                            hintText: translation(context).password,


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
                          //getData();
                        },
                        child: Text(translation(context).next,style: TextStyle(fontSize: 25,color:  Color(0xff47B5FF),),),
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
