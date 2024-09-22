import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/common/bloc/button/button_state.dart';
import 'package:recipe_app/common/bloc/button/button_state_cubit.dart';
import 'package:recipe_app/common/helper/navigator/app_navigator.dart';
import 'package:recipe_app/common/widgets/appbar/basic_appbar.dart';
import 'package:recipe_app/common/widgets/button/basic_reactive_button.dart';
import 'package:recipe_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:recipe_app/presentation/auth/pages/password_reset_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
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
              AppNavigator.push(context, const PasswordResetEmail());
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            child: Column(
              children: [
                _header(context),
                const SizedBox(height: 80),
                _inputField(context),
                const SizedBox(height: 10),
                _loginButton(),
              ],
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
            'Reset Password',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Enter the email below',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget _inputField(BuildContext context) {
    return TextField(
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
    );
  }

  Widget _loginButton() {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                usecases: SendPasswordResetEmailUseCse(),
                params: _emailCon.text);
          },
          title: 'Send Email',
        );
      },
    );
  }
}
