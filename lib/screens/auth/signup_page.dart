import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/routes/route_name.dart';
import 'package:myapp/utils/helpers.dart';
import 'package:myapp/widgets/auth/text_field.dart';
import 'package:form_validator/form_validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final AuthController controller = Get.put(AuthController());

  void submit() {
    showSnackBar("Success", "Sign Up Successful");
    if (_formKey.currentState!.validate()) {
      controller.register(
          nameController.text, emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                    const Text("Sign up"),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthField(
                      label: "Name",
                      hintText: "Enter Name",
                      isobscure: false,
                      controller: nameController,
                      validationCallBack: ValidationBuilder()
                          .required()
                          .minLength(5)
                          .maxLength(50)
                          .build(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthField(
                      label: "Enter Email",
                      hintText: "Enter Email",
                      isobscure: false,
                      controller: emailController,
                      validationCallBack:
                          ValidationBuilder().required().email().build(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthField(
                      label: "Enter Password",
                      hintText: "Enter Password",
                      isobscure: true,
                      controller: passwordController,
                      validationCallBack: ValidationBuilder()
                          .minLength(5)
                          .maxLength(30)
                          .build(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthField(
                      label: "Confirm Password",
                      hintText: "Confirm Password",
                      isobscure: true,
                      controller: confirmPasswordController,
                      validationCallBack: (arg) {
                        if (passwordController.text != arg) {
                          return "Password is not Matched";
                        } else {
                          null;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          submit();
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(
                              0xFFF88C49,
                            ),
                          ),
                        ),
                        child: Text(
                          controller.registerloading.value
                              ? "Loading..."
                              : "Sign up",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account ? ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: " Login",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              decorationThickness: 1,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(RouteName.login);
                              },
                          ),
                        ],
                      ),
                    )
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
