import 'package:baby_madics/Design/Dimens.dart';
import 'package:baby_madics/Design/Shade.dart';
import 'package:baby_madics/Design/Strings.dart';
import 'package:baby_madics/app_theme.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:card_settings/widgets/card_settings_widget.dart';
import 'package:card_settings/widgets/information_fields/card_settings_header.dart';
import 'package:card_settings/widgets/text_fields/card_settings_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final formKey = GlobalKey<FormState>();
  bool loadingButtonProgressIndicator = false;
  bool hasChangeDependencies = false;
  String title = "Spheria";
  String OrderId = "1";
  String url = "http://www.codyleet.com/spheria";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!hasChangeDependencies) {
      hasChangeDependencies = true;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          Strings.titleOrderDetails,
          style: TextStyle(
            fontSize: 20,
            color: AppTheme.darkText,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CardSettings(
          children: <CardSettingsSection>[
            CardSettingsSection(
              header: CardSettingsHeader(
                color: Colors.lightBlueAccent,
                label: 'Name',
              ),
              children: <CardSettingsWidget>[
                CardSettingsText(
                  label: 'OrderId',
                  initialValue: OrderId,
                ),
                CardSettingsText(
                  label: 'Status',
                  initialValue: "Status",
                ),
                CardSettingsText(
                  label: 'Delivery Charges',
                  initialValue: "Delivery Charges",
                ),
                CardSettingsText(
                  label: 'Discount',
                  initialValue: "Discount",
                ),
                CardSettingsText(
                  label: 'Unit',
                  initialValue: "Unit",
                ),
                CardSettingsText(
                  label: 'Quantity',
                  initialValue: "Quantity",
                ),
                CardSettingsText(
                  label: 'Total',
                  initialValue: "Total",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
