import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,spacing: 30,children: [Text("Login",style: TextStyle(
        fontSize: 24,fontWeight: FontWeight.bold
            )),
            TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: const Color.fromARGB(255, 96, 96, 96)),
          hintText: "Email",
          border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
             color:  Color.fromARGB(255, 96, 96, 96),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
            enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                  color: const Color.fromARGB(255, 158, 158, 158),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
        ),), 
        TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: const Color.fromARGB(255, 96, 96, 96)),
          hintText: "Password",
          border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
             color:  Color.fromARGB(255, 96, 96, 96),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
            enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 158, 158, 158),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
           ), 
        ),
            ),
            SizedBox(
              child: ElevatedButton(
               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
               onPressed: (){
                debugPrint("Login Button Pressed");
              }, child: Text("Login",
                 style: TextStyle(color: Colors.white, fontSize: 16),
              )),
            )
            ]),
      )));
  }
}
