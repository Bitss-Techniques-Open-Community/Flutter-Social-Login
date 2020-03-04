
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class UserProfileState extends StatelessWidget{

  var profile;
  UserProfileState(this.profile);

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
                          image: new NetworkImage(profile["picture"]["data"]["url"].toString(),)
                      )
                  ),),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: Text("profile name:  "+profile["name"]),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Text("profile email:  "+profile["email"]),
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: ()=>_logOut(context),
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
  Future<Null> _logOut(BuildContext context) async {
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    Navigator.of(context).pop();
    print('Logged out.');
  }
}