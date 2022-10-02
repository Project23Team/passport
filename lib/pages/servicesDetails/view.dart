import 'package:flutter/material.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
class ServicesDetails extends StatefulWidget {
  const ServicesDetails({Key? key}) : super(key: key);

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Text(translation(context).directorateOfPassports,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
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
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.location_city, size: 60, color: Colors
                                .black,),
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
class Eservices extends StatefulWidget {
  const Eservices({Key? key}) : super(key: key);

  @override
  State<Eservices> createState() => _EservicesState();
}

class _EservicesState extends State<Eservices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Text(translation(context).eServices,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .toFacilitateTheMomentumInTheDepartmentsAndToFacilitateDealing,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
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
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.support_agent, size: 60, color: Colors
                                .black,),
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

class PassportAcquisitionForm extends StatefulWidget {
  const PassportAcquisitionForm({Key? key}) : super(key: key);

  @override
  State<PassportAcquisitionForm> createState() => _PassportAcquisitionFormState();
}

class _PassportAcquisitionFormState extends State<PassportAcquisitionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Text(translation(context).passportAcquisitionForm,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .inOrderToOvercomeTheDifficultiesAndFacilitateTheProceduresForObtainingThePassportForTheCitizen,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
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
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.ballot, size: 60, color: Colors
                                .black,),
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

class Fingerprint extends StatefulWidget {
  const Fingerprint({Key? key}) : super(key: key);

  @override
  State<Fingerprint> createState() => _FingerprintState();
}

class _FingerprintState extends State<Fingerprint> {
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
                          Text(translation(context).fingerprint,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .fingerprint,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
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
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.fingerprint, size: 60, color: Colors
                                .black,),
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
