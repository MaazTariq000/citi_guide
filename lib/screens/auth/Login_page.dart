import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/widgets/auth/text_field.dart';
import 'package:form_validator/form_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthController controller = Get.put(AuthController());

  void submit() {
    if (_formKey.currentState!.validate()) {
      controller.login(emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text("Login Page"),
                    const SizedBox(height: 20),
                    AuthField(
                      label: "Email",
                      hintText: "Enter Email",
                      isobscure: false,
                      controller: emailController,
                      validationCallBack:
                          ValidationBuilder().required().email().build(),
                    ),
                    const SizedBox(height: 20),
                    AuthField(
                      label: "Password",
                      hintText: "Enter Password",
                      isobscure: true,
                      controller: passwordController,
                      validationCallBack:
                          ValidationBuilder().required().build(),
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.loginloading.value
                            ? null
                            : submit, // Disable button when loading
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFFF88C49),
                          ),
                        ),
                        child: Text(
                          controller.loginloading.value
                              ? "Loading..."
                              : "Login", // Update text to "Login"
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: "Register",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteName.signup);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
