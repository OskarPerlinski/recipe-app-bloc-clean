import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/bloc/button/button_state.dart';
import 'package:recipe_app/common/bloc/button/button_state_cubit.dart';
import 'package:recipe_app/common/helper/navigator/app_navigator.dart';
import 'package:recipe_app/common/widgets/appbar/basic_appbar.dart';
import 'package:recipe_app/common/widgets/button/basic_reactive_button.dart';
import 'package:recipe_app/data/auth/models/user_signin_req.dart';
import 'package:recipe_app/domain/auth/usecases/signin.dart';
import 'package:recipe_app/presentation/auth/pages/forgot_password.dart';
import 'package:recipe_app/presentation/auth/pages/signup.dart';
import 'package:recipe_app/presentation/home/pages/home.dart';

class SigninPage extends StatelessWidget {
  final UserSigninReq signinReq;
  SigninPage({super.key, required this.signinReq});

  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _header(context),
                  const SizedBox(height: 80),
                  _inputField(context),
                  const SizedBox(height: 10),
                  _loginButton(context),
                  const SizedBox(height: 100),
                  _forgotPasswrod(context),
                  const SizedBox(height: 100),
                  _createAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Enter your credential to login',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailCon,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(
              Icons.mail,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordCon,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(
              Icons.password,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          signinReq.password = _passwordCon.text;
          signinReq.email = _emailCon.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecases: SigninUseCase(), params: signinReq);
        },
        title: 'Login',
      );
    });
  }

  Widget _forgotPasswrod(BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.push(
          context,
          ForgotPasswordPage(),
        );
      },
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Dont have an account?  ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '  Sign Up',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SignupPage(),
                );
              },
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
