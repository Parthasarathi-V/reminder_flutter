import 'package:flutter/material.dart';
import 'package:reminder/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      const Text("Sign Up", style: TextStyle(fontSize: 30, color: Colors.red)),
                      const SizedBox(height: 25),
                      const Center(child: Icon(Icons.account_circle_outlined,size: 130)),

                      const SizedBox(height: 25),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "First Name",
                              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),

                      const SizedBox(height: 25),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Last Name",
                              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),

                      const SizedBox(height: 25),
                      TextField(
                          decoration: InputDecoration(
                              labelText: "Email Id",
                              labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                          )
                      ),

                      const SizedBox(height: 25),
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
                        child: const Text("Register",style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=> const LogIn()
                              )
                            );
                          },
                          child: const Text("Login")
                      )


                    ]
                )
            ),
          ),
        ),
      ),
    );
  }
}