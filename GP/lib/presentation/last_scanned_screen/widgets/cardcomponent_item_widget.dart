import 'package:flutter/material.dart';
import 'package:hierosecret/presentation/last_scanned_screen/models/cardcomponent_item_model.dart';
import 'package:hierosecret/core/app_export.dart';
import 'package:intl/intl.dart'; // Add this import

class CardComponentItemWidget extends StatelessWidget {
  final CardcomponentItemModel model;

  const CardComponentItemWidget({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse the timestamp and format it to display only the date
    String formattedDate = '';
    if (model.timeStamp?.value.isNotEmpty == true) {
      try {
        DateTime dateTime = DateTime.parse(model.timeStamp!.value);
        formattedDate = DateFormat.yMMMd().format(dateTime);
      } catch (e) {
        formattedDate = model.timeStamp!.value; // Fallback to the original value if parsing fails
      }
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (model.imageURL?.value ?? '').isNotEmpty
                ? Image.network(
                    model.imageURL!.value,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.contain, // Changed from BoxFit.cover to BoxFit.contain
                  )
                : Container(),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Prediction Result: ",
                      style: theme?.textTheme?.labelMedium?.copyWith(fontSize: 18.0)),
                  TextSpan(
                    text: model.description?.value ?? '',
                    style: CustomTextStyles.labelMediumffc18553.copyWith(fontSize: 18.0), // Set the prediction result to orange
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Date: ",
                      style: theme?.textTheme?.labelMedium?.copyWith(fontSize: 18.0)),
                  TextSpan(
                      text: "$formattedDate",
                      style: CustomTextStyles.labelMediumffc18553.copyWith(fontSize: 18.0))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
