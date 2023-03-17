import 'package:flutter/material.dart';
import 'package:nubiaville/screens/homepage.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passController = TextEditingController();
   bool isShowPass = false;
  late double deviceWidth, deviceHeight;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0E2038),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:17,),
              child: Text(
                "Expense Manager",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 4,
              color: Colors.blue,
            ),
            SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 5),
              child: Text('Username',style:TextStyle(color: Colors.white54,fontSize:15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Color(0xFF213A5C),
                ),
                child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Demo",
                      alignLabelWithHint: true, // center labastyle
                      labelStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 17,vertical: 5),
              child: Text('Password',style:TextStyle(color: Colors.white54,fontSize:15)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Container(
                width: double.infinity,
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Color(0xFF213A5C),
                    borderRadius: BorderRadius.circular(5),
                    ),
                child: TextFormField(
                  controller: passController,
                  obscureText: isShowPass,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPass = !isShowPass;
                          });
                        },
                        child: Icon(
                          isShowPass ? Icons.visibility : Icons.visibility_off,
                          size: 16,
                        )),
                    alignLabelWithHint: true,
                    // center labastyle
                    labelStyle: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 17,),
              child: SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Login".toUpperCase(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
