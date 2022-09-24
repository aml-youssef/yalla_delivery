// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:yalladelivery/core/utils/widgets/custom_dialog.dart';
// import 'package:yalladelivery/core/utils/widgets/register_text_field.dart';
// import 'package:yalladelivery/core/utils/widgets/text_button.dart';
// import 'package:yalladelivery/features/localization/manager/app_localization.dart';
// import '../../../../core/utils/routing/navigation_service.dart';
// import '../../../../core/utils/routing/route_paths.dart';
// import '../../../../core/utils/responsive/sizes.dart';

// class SignUpScreen extends ConsumerWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       body: Center(
//           child: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: Sizes.screenHeight() * 0.04,
//             ),
//             Image(
//               image: const AssetImage('assets/images/yallaDeilvery.png'),
//               width: Sizes.screenWidth() * 0.5,
//               height: Sizes.screenHeight() * 0.3,
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.04,
//             ),
//             Center(
//               child: Container(
//                 width: Sizes.screenWidth() * 0.7,
//                 decoration: const BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey)),
//                 ),
//                 child: RegisterTextField(
//                   type: TextInputType.text,
//                   label: 'الاسم ثلاثى',
//                   onChange: (v) {
//                     //login.name = v;
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return localization.text('captain_name_required');
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.02,
//             ),
//             Center(
//               child: Container(
//                 width: Sizes.screenWidth() * 0.7,
//                 decoration: const BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey)),
//                 ),
//                 child: RegisterTextField(
//                   type: TextInputType.number,
//                   label: localization.text('phone_number'),
//                   onChange: (v) {},
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return localization.text('invalid_phone_number');
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.02,
//             ),
//             Center(
//               child: Container(
//                 width: Sizes.screenWidth() * 0.7,
//                 decoration: const BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey)),
//                 ),
//                 child: RegisterTextField(
//                   type: TextInputType.text,
//                   label: localization.text('address_details'),
//                   onChange: (v) {},
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'required';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.02,
//             ),
//             Center(
//               child: Container(
//                 width: Sizes.screenWidth() * 0.7,
//                 decoration: const BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey)),
//                 ),
//                 child: RegisterTextField(
//                   type: TextInputType.text,
//                   label: 'نوع الدراجة',
//                   onChange: (v) {},
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'required';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.02,
//             ),
//             Center(
//               child: Container(
//                 width: Sizes.screenWidth() * 0.7,
//                 decoration: const BoxDecoration(
//                   border: Border(bottom: BorderSide(color: Colors.grey)),
//                 ),
//                 child: RegisterTextField(
//                   type: TextInputType.number,
//                   label: 'العمر',
//                   onChange: (v) {},
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'required';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Sizes.screenHeight() * 0.06,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Center(
//                 child: CustomTextButton(
//                   title: 'تقديم',
//                   function: () {
//                     if (_formKey.currentState!.validate()) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return CustomDialog(
//                               title:
//                                   'شكرا لك ,تم ارسال طلبك سيتم التواصل معك فى اقرب وقت ممكن',
//                               widget: [
//                                 Center(
//                                   child: CustomTextButton(
//                                     title: 'اغلاق',
//                                     function: () {
//                                       NavigationService.pushReplacementAll(
//                                           page: RoutePaths.authLogin,
//                                           isNamed: false);
//                                     },
//                                   ),
//                                 )
//                               ],
//                             );
//                           });
//                     }
//                   },
//                   radius: 25,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }

//   void pop() {}
// }
