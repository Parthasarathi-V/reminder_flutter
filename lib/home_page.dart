import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.teal[800],
                ),
                child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const topRow(),
                      topDate()
                    ]
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  height: 1000,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const tasks(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Colors.teal.shade800,
        backgroundColor: Colors.white,
        items: const <Widget>[
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const addTask()));
            });
          }
          else
            {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
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
          const SizedBox(
            height: 20,
          ),
          const Text(
              "13:00",
              style: TextStyle(
                fontSize: 23,
              )
          ),
          taskCards(titleIn: '', subtitleIn: '',),
        ]
    );
  }
}

class taskCards extends StatelessWidget {

  taskCards({required this.titleIn, required this.subtitleIn});
  String titleIn = "";
  String subtitleIn = "";

  @override
  Widget build(BuildContext context) {
    return

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 14),
          Container(
            height: 80.0,
            width: 6.0,
            decoration: BoxDecoration(
                color: Colors.teal[700],
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(10.0))
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
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  titleIn,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                subtitleIn,
                                style: const TextStyle(
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
    return const Row(
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
      padding: const EdgeInsets.all(10),
      height: 112,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("$_day, $_date",style:const TextStyle(fontSize : 30, color: Colors.white),),
          const SizedBox(height: 5),
          Text(_month,style:const TextStyle(fontSize : 20, color: Colors.white),)
        ],
      ),
    );
  }
}
