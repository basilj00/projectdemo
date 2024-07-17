import 'package:flutter/material.dart';
import 'package:flutter_exam/view/login_screen/login_screen.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    String name = "basil@gmail.com";
    String password = "123456789";
    final passwordformkey = GlobalKey<FormState>();
    final confirmpasswordformkey = GlobalKey<FormState>();

    final usernameformkey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmpasswordController = TextEditingController();

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
            Text("Sign Up For Free ",
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
            Form(
              key: confirmpasswordformkey,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Your Confirm password",
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
                    return ("Enter same Password as above");
                  }
                },
                onChanged: (value) {
                  passwordformkey.currentState!.validate();
                },
              ),
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
              
                if (usernameformkey.currentState!.validate() && passwordformkey.currentState!.validate() && confirmpasswordformkey.currentState!.validate()) {
                  if (nameController.text == name && passwordController.text == password && confirmpasswordController.text == password) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
                  } else {
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid credentials'))
                  );
                }
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? "),
            TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));


            }, 
            child: Text("Sign in") )
          ],
        ),
      ),
    )
    );
  }
}










