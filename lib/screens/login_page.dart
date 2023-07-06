import 'package:flutter/material.dart';
import 'package:multirole_app/components/text_field.dart';
import 'package:multirole_app/screens/student_view.dart';
import 'package:multirole_app/screens/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  void userType() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String userType = sp.getString('userType') ?? '';

    if (userType == 'Student') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StudentView()));
    } else {
      // if teacher
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 210,
              right: 20,
              child: Image(
                image: AssetImage('assets/images/Union1.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 20.0),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Enter your username and password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff565656)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldWidget(controller: emailController, text: 'Email'),
                TextFieldWidget(
                    controller: passwordController, text: 'Password'),
                TextFieldWidget(controller: typeController, text: 'User Type'),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();

                    sp.setString('email', emailController.text.toString());
                    sp.setString('userType', typeController.text.toString());
                    sp.setBool('isLogin', true);

                    userType();
                  },
                  child: Center(
                    child: Container(
                      width: 229,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Forgotten Password?',
                    style: TextStyle(fontSize: 15, color: Color(0xff6B6B6B)),
                  ),
                ),
                const Center(
                  child: Text(
                    'Or create a New Account',
                    style: TextStyle(fontSize: 15, color: Color(0xff6B6B6B)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
