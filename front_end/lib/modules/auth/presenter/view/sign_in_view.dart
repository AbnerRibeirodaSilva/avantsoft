import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:front_end/shared/core/dependency_injection/inject.dart';
import 'package:front_end/shared/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../store/sign_in_store.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final store = getIt<SignInStore>();
  final _formKey = GlobalKey<FormState>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = reaction<bool>((_) => store.isLoggedIn, (isLoggedIn) {
      if (isLoggedIn) {
        context.go('/home');
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      store.signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [_buildHeader(), _buildForm(), _buildSignInButton()],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildHeader() {
    return const Text(
      'Login',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  _buildSignInButton() {
    return PrimaryButton(
      onPressed: () => submit(),
      isLoading: store.isLoading,
      isEnabled: !store.isLoading,
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'E-mail'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
          onChanged: store.setEmail,
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          onChanged: store.setPassword,
        ),
        if (store.errorMessage.isNotEmpty)
          Text(store.errorMessage, style: const TextStyle(color: Colors.red)),
      ],
    );
  }
}
