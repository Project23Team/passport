import 'dart:html';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/registrationDone/view.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';

import 'package:image_picker/image_picker.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String dropdownValue ="";
  String dropdownValue2 ='';
  String dropdownValueS ='';
  String dropdownValuepd ='';
  String dropdownValuepdIraq ='';
  String dropdownValuepdMaritalStatus ='';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  //var image;
  io.File? imageFile;
  final imagepicked = ImagePicker();
  uploadImage() async {
    var pickedimage = await  imagepicked.getImage(source: ImageSource.gallery);
    if(pickedimage!=null){
      setState((){
        imageFile=io.File(pickedimage.path);
      });

    }
    else{}

  }
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child:Text(translation(context).homePage,style: TextStyle(color:Colors.white),),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 10),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 650,//or MediaQuery.of(context).size.width+300
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child:
                      Form(
                        key: _key,
                        child: ListView(
                          children: [
                            SizedBox(height: 140,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).email,
                                  hintText: translation(context).emailHint,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).placeOfOrder,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValue,
                                          // Step 4.
                                          items: <String>["",translation(context).inside, translation(context).outside]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!="",
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).typeOfMarriage,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValue2,
                                          // Step 4.
                                          items: <String>['',translation(context).normalTravel, translation(context).diplomat,translation(context).maritime,translation(context).special,translation(context).service]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!="",
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValue2 = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).sex,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValueS,
                                          // Step 4.
                                          items: <String>['',translation(context).male,translation(context).female]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!="",
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValueS = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).placeOfBirth,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValuepd,
                                          // Step 4.
                                          items: <String>['',translation(context).inside, translation(context).outside]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!='',
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValuepd = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),



                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).firstName,
                                  hintText: translation(context).firstName,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).fathersName,
                                  hintText: translation(context).fathersName,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).grandfathersName,
                                  hintText: translation(context).grandfathersName,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).surname,
                                  hintText: translation(context).surname,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).mothersName,
                                  hintText: translation(context).mothersName,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).motherFather,
                                  hintText: translation(context).motherFather,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).provinceCountry,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValuepdIraq,
                                          // Step 4.
                                          items: <String>['',
                                            translation(context).baghdad,
                                            translation(context).anbarProvince,
                                            translation(context).babylon,translation(context).alBasrah,
                                            translation(context).dhiQar,translation(context).diyalaProvince,
                                            translation(context).duhok,translation(context).erbil,
                                            translation(context).karbala,translation(context).kirkuk,
                                            translation(context).maysan,translation(context).alMuthanna,
                                            translation(context).najaf,translation(context).nineveh,
                                            translation(context).qadisiyah,translation(context).salads,
                                            translation(context).sulaymaniyah,
                                            translation(context).wasit,
                                          ]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!="",
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValuepdIraq = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(translation(context).maritalStatus,style: TextStyle(fontSize: 15,color: Colors.black54),),
                                      SizedBox(height: 5,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1,color: Colors.black.withOpacity(0.3)),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: DropdownButton<String>(
                                          underline: Container(),
                                          value: dropdownValuepdMaritalStatus,
                                          // Step 4.
                                          items: <String>['',
                                            translation(context).single,
                                            translation(context).married,
                                          ]
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              enabled: value!="",
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                          // Step 5.
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownValuepdMaritalStatus = newValue!;
                                            });
                                          },
                                        ),



                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).profession,
                                  hintText: translation(context).profession,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).dateOfBirth,
                                  hintText: translation(context).dateOfBirth,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).nationalIDNumber,
                                  hintText: translation(context).nationalIDNumber,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).email,
                                  hintText: translation(context).emailHint,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).phoneNumber,
                                  hintText: translation(context).phoneNumber,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).address,
                                  hintText: translation(context).address,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (val) {
                                  if (val != null && val.isEmpty) {
                                    return translation(context).requiredField;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15),)
                                  ),
                                  labelText: translation(context).placePhoto,
                                  hintText: translation(context).placePhoto,
                                  //suffixStyle: TextStyle(fontSize: 40)
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    uploadImage();
                                  },
                                  height: 50,
                                  shape: const StadiumBorder(),
                                  color: Theme.of(context).primaryColor,
                                  child: Center(
                                    child: Text(
                                      translation(context).placePhoto,
                                      style: const TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),

                                ),

                              ],
                            ),


                            imageFile == null? Text("data"):
                            Image.file(imageFile!),





                            MaterialButton(
                              onPressed: () {
                                if (_key.currentState != null && _key.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegistrationDone()));
                                }
                              },
                              height: 50,
                              shape: const StadiumBorder(),
                              color: Theme.of(context).primaryColor,
                              child: Center(
                                child: Text(
                                  translation(context).submitInfo,
                                  style: const TextStyle(color: Colors.white, fontSize: 20),
                                ),
                              ),

                            )



                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -80,
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

              ),

            ],
          ),
        ],
      ),

    );
  }
}
