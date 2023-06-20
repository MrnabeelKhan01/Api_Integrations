import 'package:api_integrat/infrastruture/services/auth.dart';
import 'package:flutter/material.dart';

class LogInBody extends StatelessWidget {
  LogInBody({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              _authServices.login(
                  email: _emailController.text.toString(),
                  password: _passwordController.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text('Login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
