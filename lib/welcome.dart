import 'package:flutter/material.dart';
import 'package:icthubtest/SignUp.dart';
import 'package:icthubtest/login.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Logsin extends StatelessWidget {
  const Logsin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text("Welcome", 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                   
                  ),
                  ),
                  SizedBox(height: 20,),
                  Text("A correlation heatmap is a graphical tool that displays the correlation between multiple variables as a color-coded matrix. It's like a color chart 🌈 that shows us how closely related",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 114, 109, 111)
                  ),
                  ),
                  
                ],
              ),
                  /*Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/ton.jpg"),
                        ),
                    ),
                  ),*/
                  Column(
                    children: [
                      MaterialButton(
                        height: 60,
                        minWidth: double.infinity,
                        onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                        ),
                        ),
                        const SizedBox(height: 20,),
                        MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                          },
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text("Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          )
                    ],
                  )
                  ],
          ),
        ),
        ),
        bottomNavigationBar: GNav(
          
          //backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          color: Color.fromARGB(255, 9, 49, 157),
          activeColor: Color.fromARGB(255, 19, 114, 238),
          tabs: [
            GButton(icon: Icons.home, text: 'Home',),
            GButton(icon: Icons.search, text: 'Search',),
            GButton(icon: Icons.settings, text: 'Settings',),
            GButton(icon: Icons.favorite_border, text: 'DONE',)
          ]
        ),
    );

  }
}