import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reminder/search_page.dart';
import 'addTask.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[800],
      body: SingleChildScrollView(
        child: SafeArea(
          child :Column(
            children: [
              Container(
                height: 180,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.teal[800],
                ),
                child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      topRow(),
                      topDate()
                    ]
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  height: 1000,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: tasks(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal.shade800,
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.task_alt_rounded, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.search_outlined, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 0) {
            HomeView();
          }
          else if(index == 1)
          {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => addTask()));
            });
          }
          else
            {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              });
            }
        },
      ),
    );
  }
}

class tasks extends StatelessWidget {
  const tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
              "13:00",
              style: TextStyle(
                fontSize: 23,
              )
          ),
          taskCards(),
        ]
    );
  }
}

class taskCards extends StatefulWidget {
  const taskCards({super.key});

  @override
  State<taskCards> createState() => _taskCardsState();
}

class _taskCardsState extends State<taskCards> {
  @override
  Widget build(BuildContext context) {
    return

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 14),
          Container(
            height: 80.0,
            width: 6.0,
            decoration: BoxDecoration(
                color: Colors.teal[800],
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0))
            ),
          ),
          Container(
              width: 360,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                        color: Colors.white,
                        elevation: 20.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          width: 350,
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                  "Study",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "Tomarrow is yours exam must you study",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  ]
              )
          )
        ],
      );
  }
}

class topRow extends StatefulWidget {
  const topRow({super.key});

  @override
  State<topRow> createState() => _topRowState();
}

class _topRowState extends State<topRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Daily",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 8.0),
            Text("meetings",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ]
    );

  }
}

class topDate extends StatelessWidget {

  //DateTime now = DateTime.now();
  String _day = DateFormat('EEE').format(DateTime.now());
  String _date = DateFormat('d').format(DateTime.now());
  String _month = DateFormat('MMM  yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 112,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("${_day}, ${_date}",style:TextStyle(fontSize : 30, color: Colors.white),),
          SizedBox(height: 5),
          Text("${_month}",style:TextStyle(fontSize : 20, color: Colors.white),)
        ],
      ),
    );
  }
}
