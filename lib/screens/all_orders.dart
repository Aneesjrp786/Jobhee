import 'package:baby_madics/Design/Strings.dart';
import 'package:baby_madics/app_theme.dart';
import 'package:baby_madics/screens/order_details.dart';
import 'package:flutter/material.dart';

class AllOrders extends StatefulWidget {
  @override
  _AllOrdersState createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  bool hasChangeDependencies = false;
  String OrderId = "1";
  String Details = "Details";
  List<String> images = [
    "assets/images/userImage.png",
    "assets/images/bottom2.png",
    "assets/images/bottom1.png",
    "assets/images/bottom2.png",
  ];

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
          title: Text(
            Strings.titleAllOrder,
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
        body: ListView.separated(
          itemBuilder: (BuildContext, index) {
            return Card(
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[400], width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    title: Text(
                      "OrderId: ${OrderId}",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(
                      "Details: ${Details}",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.green,
                      disabledColor: Colors.green[100],
                      iconSize: 30,
                      onPressed: () => test(),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext, index) {
            return Divider(height: 1);
          },
          itemCount: images.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }

  test() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderDetails()),
    );
  }
}
