import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback onPressed;
  const PrimaryButton({
    super.key,
    this.isLoading = false,
    this.isEnabled = true,
    required this.onPressed,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled ? widget.onPressed : null,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        backgroundColor: WidgetStateProperty.all(
          widget.isLoading ? Colors.grey : Theme.of(context).primaryColor,
        ),
      ),
      child:
          widget.isLoading
              ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              )
              : Text(
                'Sign In',
                style: TextStyle(
                  color: widget.isLoading ? Colors.black : Colors.white,
                ),
              ),
    );
  }
}
