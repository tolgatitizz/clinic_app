import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DietList_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        toolbarHeight: 40.00,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image(image: NetworkImage("https://image.shutterstock.com/image-vector/gas-oil-logo-design-vector-260nw-1512762851.jpg")),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                          children: [
                            Text("Clinic Name"),
                            Text("Subtext"),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Period"),
                  VerticalDivider(width: 2,color: Colors.black54,),
                  Text("FoodName"),
                  Text("FoodName"),
                  Text("FoodName"),
                  Text("FoodName"),
                ],
              ),
                  Row(
                    children: [
                      Text("Period"),
                      VerticalDivider(width: 2,color: Colors.black54,),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Period"),
                      VerticalDivider(width: 2,color: Colors.black54,),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Period"),
                      VerticalDivider(width: 2,color: Colors.black54,),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Period"),
                      VerticalDivider(width: 2,color: Colors.black54,),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                      Text("FoodName"),
                    ],
                  ),
      ]
            ),
          ),
        ],
      ),
    );
  }
}
