import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/utils/uitls.dart';
import '../utils/colors.dart';
import '../widgets/textfield_input.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SingUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
  }

  void _selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void _signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        userName: _userNameController.text,
        bio: _bioController.text,
        file: _image!);
    setState(() {
      _isLoading = false;
    });

    if (res != 'Success') {
      showSnackBar(res, context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Signup successful")));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                SvgPicture.asset(
                  'assets/images/instagram.svg',
                  color: Colors.blue,
                ),
                SizedBox(height: 40.h),

                // Take Image Field
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 70.r, backgroundImage: MemoryImage(_image!))
                        : CircleAvatar(
                            radius: 70.r,
                            backgroundImage:
                                const AssetImage('assets/images/avater.png'),
                          ),
                    Positioned(
                      left: 70,
                      bottom: -5,
                      child: IconButton(
                        onPressed: () {
                          _selectImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                // Username Field
                TextFieldInput(
                  textEditingController: _userNameController,
                  hintText: 'Enter your Username',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20.h),

                //Email Field
                TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your Email',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20.h),

                // Password Field
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter your Password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                SizedBox(height: 20.h),

                // Bio Field
                TextFieldInput(
                  textEditingController: _bioController,
                  hintText: 'Enter your Bio',
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20.h),

                // SignUp button
                InkWell(
                  onTap: () => _signUpUser(),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 20.h),

                // transition to sing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          "Log in.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
