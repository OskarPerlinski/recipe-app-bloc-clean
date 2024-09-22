import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/bloc/button/button_state.dart';
import 'package:recipe_app/common/bloc/button/button_state_cubit.dart';
import 'package:recipe_app/common/helper/navigator/app_navigator.dart';
import 'package:recipe_app/common/widgets/appbar/basic_appbar.dart';
import 'package:recipe_app/common/widgets/button/basic_reactive_button.dart';
import 'package:recipe_app/data/auth/models/user_creation_req.dart';
import 'package:recipe_app/data/auth/models/user_signin_req.dart';
import 'package:recipe_app/domain/auth/usecases/signup.dart';
import 'package:recipe_app/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
   SignupPage({super.key});

  final TextEditingController _userNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

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
            listener:  (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
            'Sign up',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Create your account',
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
          controller: _userNameCon,
          decoration: InputDecoration(
            hintText: 'Username',
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
              Icons.people,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 10),
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
              Icons.email,
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
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecases: SignupUseCase(),
                  params: UserCreationReq(
                    username: _userNameCon.text,
                    email: _emailCon.text,
                    password: _passwordCon.text,
                  ),
                );
          },
          title: 'Sign up',
        );
      }
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Already have an account?  ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '  Login',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                   SigninPage(
                    signinReq: UserSigninReq(
                      email: _emailCon.text,
                      ),
                   ),
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
