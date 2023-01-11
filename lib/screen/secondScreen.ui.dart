import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:trinity_test/function/global.fn.dart';
import 'package:trinity_test/function/secondScreen.fn.dart';
import 'package:trinity_test/helper/colorpicker.dart';

class SecondScreenUi extends StatefulWidget {
  const SecondScreenUi({
    Key? key,
    this.index,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  }) : super(key: key);

  final int? index;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  @override
  State<SecondScreenUi> createState() => _SecondScreenUiState();
}

class _SecondScreenUiState extends State<SecondScreenUi> {
  late GlobalFn globalFn = GlobalFn(context, setState);
  late SecondScreenFn secondScreenFn = SecondScreenFn(context, setState);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    secondScreenFn.firstNameController.text = widget.firstName.toString();
    secondScreenFn.lastNameController.text = widget.lastName.toString();
    secondScreenFn.emailController.text = widget.phone.toString();
    secondScreenFn.phoneController.text = widget.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    globalFn.screenHeight = MediaQuery.of(context).size.height;
    globalFn.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  final data = {
                    "index": widget.index,
                    "firstName": secondScreenFn.firstNameController.text,
                    "lastName": secondScreenFn.lastNameController.text,
                    "email": secondScreenFn.emailController.text,
                    "phone": secondScreenFn.phoneController.text,
                  };

                  Navigator.of(context).pop(data);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colorpick.primaryOrange,
                  ),
                ),
              ),
            ),
          )
        ],
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colorpick.primaryOrange,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colorpick.primaryOrange),
              child: const Icon(Icons.person),
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            width: globalFn.screenWidth,
            margin: const EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: const Text(
              'Main Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Text('First Name'),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    width: globalFn.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    ),
                    child: TextField(
                      controller: secondScreenFn.firstNameController,
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isCollapsed: true,
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Last Name'),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    width: globalFn.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    ),
                    child: TextField(
                      controller: secondScreenFn.lastNameController,
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isCollapsed: true,
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.withOpacity(0.2),
            width: globalFn.screenWidth,
            margin: const EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: const Text(
              'Sub Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    width: globalFn.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    ),
                    child: TextField(
                      controller: secondScreenFn.emailController,
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isCollapsed: true,
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Phone'),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    width: globalFn.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    ),
                    child: TextField(
                      controller: secondScreenFn.phoneController,
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isCollapsed: true,
                        counterText: '',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
