import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:foodybite/constants/icons.dart';
import 'package:foodybite/constants/images.dart';
import 'package:foodybite/constants/values.dart';
import 'package:foodybite/controllers/profile_controller.dart';
import 'package:foodybite/utils/size_config.dart';
import 'package:foodybite/utils/validators.dart';
import 'package:foodybite/view/dialogs/m_dialogs.dart';
import 'package:foodybite/view/widgets/app_bar.dart';
import 'package:foodybite/view/widgets/input_field.dart';
import 'package:foodybite/view/widgets/mbutton.dart';
import 'package:get/get.dart';

class EditPofilePage extends StatefulWidget {
  @override
  _EditPofilePageState createState() => _EditPofilePageState();
}

class _EditPofilePageState extends State<EditPofilePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: Values.edit_profile.tr,
        appBar: AppBar(),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const SizedBox(height: defaultPadding * 2),
              SizedBox(
                height: getRelativeWidth(0.3),
                width: getRelativeWidth(0.3),
                child: Stack(
                  children: [
                    GetBuilder<ProfileController>(builder: (_con) {
                      return CircleAvatar(
                        radius: getRelativeWidth(0.15),
                        backgroundImage: _con.imageFile != null
                            ? FileImage(_con.imageFile)
                            : const AssetImage(
                                Images.d1,
                              ),
                      );
                    }),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          MDialogs.imagePickerDialog(
                            onCameraTap: () {
                              Get.back();
                              _profileController.getImageFromCamer();
                            },
                            onGalleryTap: () {
                              Get.back();
                              _profileController.getImageFromGallery();
                            },
                          );
                        },
                        child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                color: primaryColor,
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
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding * 3),
              InputField(
                hint: 'John Williams',
                controller: _nameController,
                isWhite: false,
                iconPath: MIcons.user_o,
              ),
              const SizedBox(height: defaultPadding),
              InputField(
                hint: 'john.williams@gmail.com',
                controller: _emailController,
                isWhite: false,
                validator: (val) => Validators.emailValidator(val),
                iconPath: MIcons.mail,
              ),
              const Spacer(),
              MButton(
                label: Values.update.tr,
                onTap: () {},
              ),
              const SizedBox(height: defaultPadding * 2),
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
