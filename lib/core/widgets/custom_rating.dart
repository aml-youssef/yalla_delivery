import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yalla_delivery/core/widgets/text_button.dart';
import 'custom_form_field.dart';

class CustomRating extends StatelessWidget {
  final void Function() function;
  CustomRating({Key? key, required this.function}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Center(
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemSize: 30,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // print(rating);
              // rateOrder.rate = rating;
            },
          ),
        ),
        actions: <Widget>[
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: CustomFormField(
              hintText: 'add_reply', // localization.text('add_reply'),
              minLines: 5,
              maxLines: 5,
              maxLength: 150,
              onChanged: (v) {
                // rateOrder.description = v.trim();
              },
            ),
          ),
          Center(
            child: CustomTextButton(
              title: 'send', //localization.text('send'),
              function: () {
                if (_formKey.currentState!.validate()) {
                  function();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
