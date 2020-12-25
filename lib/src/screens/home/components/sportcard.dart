import 'package:flutter/material.dart';
import 'package:live/Reposetori/Models/categories.dart';
import 'package:live/Reposetori/Models/tree.dart';

class SportCard extends StatefulWidget {
  Tree sport;
  bool visibilityInfo;
  SportCard({this.sport, this.visibilityInfo});
  @override
  MySportCard createState() => MySportCard(sport, visibilityInfo);
}

class MySportCard extends State<SportCard> {
  Tree tree;
  bool visibilityInfo;
  MySportCard(this.tree, this.visibilityInfo);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(14, 10, 14, 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
          child: InkWell(
            onTap: () {
              if (visibilityInfo) {
                visibilityInfo = false;
              } else {
                visibilityInfo = true;
              }
              setState(() {});
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Text(
                          tree.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.navigate_next_outlined),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: visibilityInfo,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Divider(color: Colors.black),
                        ),
                        for (int i = 0; i < tree.categories.length; i++)
                          childCard(tree.categories[i])
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget childCard(Categories categori) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            categori.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        for (int n = 0; n < categori.tournaments.length; n++)
          Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 25, top: 5, bottom: 5),
                  child: Text(categori.tournaments[n].title))
            ],
          )
      ],
    );
  }
}
