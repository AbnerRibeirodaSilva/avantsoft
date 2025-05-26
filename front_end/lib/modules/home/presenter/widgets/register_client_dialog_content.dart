import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/home_store.dart';

class RegisterClientDialogContent extends StatefulWidget {
  final HomeStore store;
  const RegisterClientDialogContent({super.key, required this.store});

  @override
  State<RegisterClientDialogContent> createState() =>
      _RegisterClientDialogContentState();
}

class _RegisterClientDialogContentState
    extends State<RegisterClientDialogContent> {
  final TextEditingController _birthdateTextController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.store.registerClient();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AlertDialog(
          title: const Text('Register Client'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: widget.store.setName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: widget.store.setEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _birthdateTextController,
                  decoration: const InputDecoration(
                    labelText: 'Birthdate (YYYY-MM-DD)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Birthdate is required';
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      _birthdateTextController.text =
                          date.toIso8601String().split('T')[0];
                      widget.store.setBirthdate(_birthdateTextController.text);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => _submit(),
              child: const Text('Register'),
            ),
          ],
        );
      },
    );
  }
}
