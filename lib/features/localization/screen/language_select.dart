// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:yalladelivery/core/utils/functions/helper_functions.dart';
// import 'package:yalladelivery/core/utils/widgets/text_button.dart';
// import 'package:yalladelivery/features/Auth/presentation/pages/login.dart';
// import 'package:yalladelivery/features/localization/data/localization_model.dart';
// import 'package:yalladelivery/features/localization/manager/app_localization.dart';
// import 'package:yalladelivery/features/localization/manager/change_language_provider.dart';
// import 'package:yalladelivery/features/localization/widgets/select_card.dart';
// import '../../../core/utils/routing/navigation_service.dart';


// class LanguageSelect extends ConsumerWidget {
//   static bool selectLang = false;
//   final bool? changelang;

//   const LanguageSelect({Key? key, this.changelang}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ChangeLanguageProvider changeLanguage =
//         ref.read(languageProvider.notifier);
//     final List<LocalizationModel> _lang = [];
//     _lang.add(LocalizationModel(
//         id: 1,
//         label: 'العربية',
//         image: 'assets/images/eg.png',
//         selected: false));
//     _lang.add(
//       LocalizationModel(
//         id: 2,
//         label: 'English',
//         selected: false,
//         image: 'assets/images/en.jpg',
//       ),
//     );
//     _lang.add(
//       LocalizationModel(
//         id: 3,
//         label: 'اردو',
//         image: 'assets/images/or.png',
//         selected: false,
//       ),
//     );

//     return Directionality(
//       textDirection: localization.currentLanguage.toString() == 'en'
//           ? TextDirection.rtl
//           : TextDirection.ltr,
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 children: <Widget>[
//                   const SizedBox(height: 50),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: Text(localization.text('chooseLanguage')!,
//                         textAlign: TextAlign.right,
//                         style:
//                             TextStyle(color: Theme.of(context).primaryColor)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[200],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey[200],
//                           ),
//                           child: SelectCard(
//                             listOflocalizationModel: _lang,
//                             changeLanguage: changeLanguage,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   CustomTextButton(
//                       title: localization.text('save')!,
//                       function: () async {
//                         if (changeLanguage.selectLang) {
//                           await localization.setNewLanguage(
//                               changeLanguage.lang, true);
//                           HelperFunctions.saveFirstTime();
//                           NavigationService.pushReplacement(
//                               page: const LoginScreen(), isNamed: false);
//                         }
//                       })
//                 ],
//               ),
//             ),
//             Visibility(
//               visible: changelang != null,
//               child: Positioned(
//                 top: 40,
//                 left: 20,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
