import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';
import '../widgets/textfield_input.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),

              // Svg Image
              SvgPicture.asset('assets/images/instagram.svg',
                  color: primaryColor, height: 64),
              const SizedBox(height: 60),

              // Circle widget to accept and Show our selection file
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('assets/images/avater.png'),
                  ),
                  Positioned(
                      left: 80,
                      bottom: -10,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),
              const SizedBox(height: 20),

              // Username Field
              TextFieldInput(
                textEditingController: _emailController,
                hinText: 'Enter your Username',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFieldInput(
                textEditingController: _emailController,
                hinText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // password Field
              TextFieldInput(
                textEditingController: _passwordController,
                hinText: 'Enter your Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 20),

              // Bio Field
              TextFieldInput(
                textEditingController: _emailController,
                hinText: 'Enter your Bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),

              // SingUp Button
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                  child: const Text(
                    'Sing Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // transition to sing up
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Log in.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
