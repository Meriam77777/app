import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',

                style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Welcome back! Please login to your account',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),


              TextField(
                controller: controller.emailController,  //recuperer et gerer le champ
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),  //bordure du champ
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),

              TextField(
                obscureText: true,
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.center,
                child: TextButton(    //button sans bordure
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() => SizedBox(
                width: double.infinity,
                height: 50,
                child:
                ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.login,//called when i click to login button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Don’t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold),
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



