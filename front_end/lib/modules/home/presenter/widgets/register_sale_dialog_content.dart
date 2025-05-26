import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/home_store.dart';

class RegisterSaleDialogContent extends StatefulWidget {
  final HomeStore store;
  final String clientId;
  const RegisterSaleDialogContent({
    super.key,
    required this.store,
    required this.clientId,
  });

  @override
  State<RegisterSaleDialogContent> createState() =>
      _RegisterSaleDialogContentState();
}

class _RegisterSaleDialogContentState extends State<RegisterSaleDialogContent> {
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await widget.store.registerSale(clientId: widget.clientId);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AlertDialog(
          title: const Text('Register Sale'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),

                  decoration: const InputDecoration(labelText: 'Value'),
                  onChanged: widget.store.setSaleValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value is required';
                    }
                    final double? parsed = double.tryParse(value);
                    if (parsed == null || parsed <= 0) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  onChanged: widget.store.setSaleDate,
                  decoration: const InputDecoration(
                    labelText: 'Date (YYYY-MM-DD)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date is required';
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      _dateController.text =
                          picked.toIso8601String().split('T')[0];
                      widget.store.setSaleDate(_dateController.text);
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
            ElevatedButton(onPressed: _submit, child: const Text('Register')),
          ],
        );
      },
    );
  }
}
