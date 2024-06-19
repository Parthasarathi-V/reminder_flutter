import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder/home_page.dart';
import 'package:reminder/search_page.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}
class _addTaskState extends State<addTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Task", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal[800],
          leading: Icon(Icons.arrow_back,color: Colors.white),
        ),
        body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                    decoration: InputDecoration(
                        labelText: "Subtitle",
                        labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    )
                ),
              ),
              TextField(
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
                      //icon: Icon(Icons.search_outlined,color: Colors.teal[900]),
                      labelStyle: TextStyle(fontSize: 15, color: Colors.teal[900]),
                      fillColor: Colors.red,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                  )
              ),
            ],
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
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
            });
          }
          else if(index == 1)
          {
              addTask();
          }
          else
          {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            });
          }
        },
      ),
    )
    );
  }
}
