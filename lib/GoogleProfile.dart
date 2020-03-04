
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserProfile extends StatelessWidget{

  var googleProfile;
  String name,photo,email;
  GoogleUserProfile(this.name,this.email,this.photo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("User Information"),
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon:  Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                width: 100.0,
                height: 190.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(photo,)
                    )
                ),),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: Text("profile name:  "+name),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text("profile email:  "+email),
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: ()=>signOutGoogle(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Logout"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOutGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      Navigator.of(context).pop();
      print('Logged out.');
    }on Exception catch(_){}
  }
}