import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';

class EditPofilePage extends StatefulWidget {
  @override
  _EditPofilePageState createState() => _EditPofilePageState();
}

class _EditPofilePageState extends State<EditPofilePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: 'Edit Profile',
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            children: [
              const SizedBox(height: kPadding * 2),
              SizedBox(
                height: getRelativeWidth(0.3),
                width: getRelativeWidth(0.3),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: getRelativeWidth(0.15),
                      backgroundImage: AssetImage(Images.d1),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                              )),
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kPadding * 3),
              InputField(
                hint: 'John Williams',
                controller: _nameController,
                isWhite: false,
                iconPath: MIcons.user_o,
              ),
              const SizedBox(height: kPadding),
              InputField(
                hint: 'john.williams@gmail.com',
                controller: _emailController,
                isWhite: false,
                validator: (val) => Validators.emailValidator(val),
                iconPath: MIcons.mail,
              ),
              const Spacer(),
              MButton(
                label: 'Update',
                onTap: () {},
              ),
              const SizedBox(height: kPadding * 2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
