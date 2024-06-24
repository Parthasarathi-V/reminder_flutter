import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'addTask.dart';
import 'home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          leading: const Icon(Icons.arrow_back, color: Colors.white,),
          title: const Text("Search", style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            const searchBar(),
            Divider(
              thickness: 5,
              color: Colors.teal[900],
            ),
            const tasks(),

          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.teal.shade800,
          backgroundColor: Colors.white,
          items: const <Widget>[
            Icon(Icons.task_alt_rounded, size: 30, color: Colors.white),
            Icon(Icons.add, size: 30, color: Colors.white),
            Icon(Icons.search_outlined, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            if (index == 0) {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
              });
            }
            else if(index == 1)
            {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const addTask()));
              });
            }
            else
            {
              const SearchPage();
            }
          },
        ),
      ),
    );
  }
}

class searchBar extends StatefulWidget {
  const searchBar({super.key});
  @override
  State<searchBar> createState() => _searchBarState();
}
class _searchBarState extends State<searchBar> {
  TextEditingController dateController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white60,
      ),
      child: Center(
        child: TextField(
            controller: dateController,
            onTap:() async{
              DateTime? pickedDate =  await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025)
              );
              if(pickedDate != null)
              {
                String modifiedDate = DateFormat("d MMM yyyy").format(pickedDate);
                setState(() {
                  dateController.text = modifiedDate.toString();
                });
              }
              else
              {
                print("not selected");
              }
            },

            decoration: InputDecoration(
                hintText: "Choose Date",
                icon: Icon(Icons.search_outlined,color: Colors.teal[900]),
                labelStyle: TextStyle(fontSize: 15, color: Colors.teal[900]),
                fillColor: Colors.red,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
            )
        ),
      ),
    );

  }
}



