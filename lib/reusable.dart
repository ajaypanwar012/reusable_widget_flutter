import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {

  final String img; // image url
  final String item; // item name
  final String variety; // variety name
  final int price; // price
  final double availability; // should be between ( 0.0 and 1.0)

  ReusableWidget({this.img, this.item, this.variety, this.price, this.availability});
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width - (MediaQuery.of(context).padding.left + MediaQuery.of(context).padding.right);
    var height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom);

    return Container(
      width: width/2.4,
      height: height/4.3,
      //color: Colors.grey,
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              img,
              loadingBuilder: (context, child, progress){
                return progress == null
                    ? child
                    : LinearProgressIndicator(); // shows progress bar till the img is not fetched
              },
              height: height/11,
              width: width/2.4,
              fit: BoxFit.fitWidth,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(width/40, height/120,0,0),
              child: Text(
                item,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width/18,
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(width/40,0,0,0),
              child: Text(
                variety,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: width/25,
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(width/40, height/50,0, height/150),
              child: Row(
                children: <Widget>[
                  Text(
                    '₹',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width/15,
                    ),
                  ),
                  Text(
                    '$price',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width/15,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, height/200, 0, 0),
                    child: Text(
                      '/kg',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width/25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: availability,

                  // Red Color : if no. of items available is less than 25%
                  // Green Color : otherwise.
                  valueColor: availability < 0.25 ? AlwaysStoppedAnimation(Colors.red): AlwaysStoppedAnimation(Colors.green),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
