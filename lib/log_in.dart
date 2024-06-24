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
            padding: const EdgeInsets.all(20),
            child: Container(
                child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text("Welcome" ,style: TextStyle(fontSize: 30, color: Colors.black)),
                      const SizedBox(height: 10),
                      const Text("log In", style: TextStyle(fontSize: 30, color: Colors.red)),
                      const SizedBox(height: 25),
                      const Center(child: Icon(Icons.login,size: 130)),

                      const SizedBox(height: 30),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Email Id",
                              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),

                      const SizedBox(height: 30),
                      TextField(
                          obscureText: true,
                          decoration: InputDecoration(

                              labelText: "Password",
                              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),
                      const SizedBox(height: 25),

                      MaterialButton(
                        onPressed: (){print("");},
                        child: const Text("Login",style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()
                              )
                            );
                          },
                          child: const Text("Register", style: TextStyle(color:Colors.blue),))

                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}
