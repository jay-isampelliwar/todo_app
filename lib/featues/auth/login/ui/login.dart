import 'package:flutter/material.dart';
import 'package:todo_app/constant/const_sizebox.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.02),
          child: Column(
            children: [
              constHightSizedBox(0.14, size.height),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              constHightSizedBox(0.12, size.height),
              TextField(
                decoration: myInputDecoration(hintText: "Mobile Number"),
              ),
              constHightSizedBox(0.02, size.height),
              TextField(
                decoration: myInputDecoration(hintText: "Password"),
              ),
              constHightSizedBox(0.06, size.height),
              GestureDetector(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // !Login loading button
                  child: Align(
                      child: Visibility(
                    visible: true,
                    replacement: CircularProgressIndicator(
                      color: Colors.grey.shade200,
                      strokeWidth: 3,
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  )),
                ),
              ),
              constHightSizedBox(0.06, size.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //! Navigate to sign up page
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration myInputDecoration({required String hintText}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    hintText: hintText,
    hintStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.grey.shade500,
    ),
  );
}
