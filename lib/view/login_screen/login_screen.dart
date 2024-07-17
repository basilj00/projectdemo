
import 'package:flutter/material.dart';
import 'package:flutter_exam/view/home_screen/home_screen.dart';
import 'package:flutter_exam/view/registration_screen/registration_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});



 
   @override
  Widget build(BuildContext context) {
    String name = "basil@gmail.com";
    String password = "123456789";
    final passwordformkey = GlobalKey<FormState>();
    final usernameformkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: true,
    home: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.white,
      
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back)
         
        ),
        body: Column(
          children: [
            Text("Sign to your Account",
            style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 50),
            Form(
              key: usernameformkey,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Your Email Address",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value != null && value.contains("@")) {
                    return null;
                  } else {
                    return ("Enter a valid username");
                  }
                },
                onChanged: (value) {
                  usernameformkey.currentState!.validate();
                },
              ),
            ),
            SizedBox(height: 30),
            Form(
              key: passwordformkey,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Your password",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value != null && value.length >= 7) {
                    return null;
                  } else {
                    return ("Enter a valid Password");
                  }
                },
                onChanged: (value) {
                  passwordformkey.currentState!.validate();
                },
              ),
            ),
            SizedBox(height: 30),

            Row(
              children: [
                
                Icon(Icons.check_box_outlined),
                Text("Remember Me"),
                Spacer(),
              TextButton(onPressed: () {},
               child: Text("Forget Password"))
              ],
              

            ),
            SizedBox(height: 40),
            ElevatedButton(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, 
    backgroundColor: Colors.blue, 
    textStyle: TextStyle(
      fontSize: 16, // Text size
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), 
    ),
    padding: EdgeInsets.symmetric(horizontal: 180, vertical: 25), 
  ),
  onPressed: () {
              
                if (usernameformkey.currentState!.validate() && passwordformkey.currentState!.validate()) {
                  if (nameController.text == name && passwordController.text == password) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
                  } else {
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid credentials'))
                  );
                }
              },
              child: Text("Sign in"),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? "),
            TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));

            }, 
            child: Text("Sign up") )
          ],
        ),
      ),
    )
    );
  }
}

