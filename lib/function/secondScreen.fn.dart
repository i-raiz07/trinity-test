import 'package:flutter/material.dart';

class SecondScreenFn {
  BuildContext context;
  Function(VoidCallback) setState;
  SecondScreenFn(this.context, this.setState);

  bool isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
}
