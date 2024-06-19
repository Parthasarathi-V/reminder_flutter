import 'package:flutter/material.dart';
import 'package:reminder/sign_up.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Container(
                child: Column(
                    children: [
                      SizedBox(height: 25),
                      Text("Welcome" ,style: TextStyle(fontSize: 30, color: Colors.black)),
                      SizedBox(height: 10),
                      Text("log In", style: TextStyle(fontSize: 30, color: Colors.red)),
                      SizedBox(height: 25),
                      Center(child: Icon(Icons.login,size: 130)),

                      SizedBox(height: 30),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Email Id",
                              labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),

                      SizedBox(height: 30),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(

                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),
                      SizedBox(height: 25),

                      MaterialButton(
                        onPressed: (){print("");},
                        child: Text("Login",style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SignUp()
                              )
                            );
                          },
                          child: Text("Register", style: TextStyle(color:Colors.blue),))

                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}
