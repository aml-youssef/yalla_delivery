import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/utils/media_quiry_values.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/cubit/myprofile_cubit.dart';
import '../../../../config/themes/text_styles.dart';
import '../../../../core/widgets/image_picker_dialog.dart';
import '../../../../core/widgets/register_text_field.dart';
import '../../../../service_locator.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // String newemail = '', newphone = '';

    return BlocProvider(
        create: (context) => sl<MyprofileCubit>()..getMyProfileData(),
        child: BlocBuilder<MyprofileCubit, MyprofileState>(
            // bloc: BlocProvider.of<MyprofileCubit>(context)..getMyProfileData(),
            builder: (context, state) {
          return Scaffold(
            //TODO:remove the scafold
            body: Form(
              key: _form,
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: state is MyprofileLoadedState
                            ? NetworkImage(state
                                .driver.img) //TODO:what if img is null???????
                            : const AssetImage('assets/images/8.jpeg')
                                as ImageProvider,
                        child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                                onTap: () {
                                  ImagePickerDialog().show(
                                    context: context,
                                    onGet: (imgFile) =>
                                        BlocProvider.of<MyprofileCubit>(context)
                                            .updateMyProfileImg(
                                                img: File(imgFile!.path)),
                                  );
                                  // debugPrint(
                                  //     '3333333333333333333330000000000 navigate');
                                  // Navigator.pushNamed(
                                  //     context, AppRoutes.changePasswordScreen);
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                ))),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        state is MyprofileLoadedState
                            ? state.driver.username
                            : '...',
                        style: MainTheme.headingTextStyle
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: Container(
                        width: context.width * 0.7,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: RegisterTextField(
                            label: 'رقم الحساب',
                            hint: state is MyprofileLoadedState
                                ? state.driver.idNum
                                : '...',
                            type: TextInputType.phone,
                            icon: Icons.line_style),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: Container(
                        width: context.width * 0.7,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: RegisterTextField(
                          readOnly: true,
                          label:
                              'phone_number', // localization.text('phone_number'),
                          hint: state is MyprofileLoadedState
                              ? state.driver.phone
                              : '...',
                          type: TextInputType.phone,
                          icon: Icons.phone,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: Container(
                        width: context.width * 0.7,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: RegisterTextField(
                          onTap: () {
                            debugPrint(
                                '3333333333333333333330000000000 navigate');
                            // Navigator.pushNamed(
                            //     context, RoutePaths.changePasswordScreen);
                          },
                          label: 'password', //localization.text('password'),
                          // visibility: true,
                          hint: '********',
                          type: TextInputType.text,
                          edit: true,
                          readOnly: true,
                          icon: Icons.lock,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Center(
                      child: Container(
                        width: context.width * 0.7,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                        ),
                        child: RegisterTextField(
                          readOnly: true,
                          label: 'email', //localization.text('email'),
                          hint: state is MyprofileLoadedState
                              ? state.driver.email
                              : '...',
                          type: TextInputType.text,
                          icon: Icons.mail,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
