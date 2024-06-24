import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder/home_page.dart';
import 'package:reminder/model/user.dart';
import 'package:reminder/search_page.dart';
import 'package:reminder/serivice/user_service.dart';

class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}
class _addTaskState extends State<addTask> {
  final TextEditingController _dateInput = TextEditingController();
  final TextEditingController _titleInput = TextEditingController();
  final TextEditingController _subtitleInput = TextEditingController();
  bool _validataTask = false;
  bool _validataSubtitle = false;
  bool _validataDate = false;
  var _UserServices = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Task", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal[800],
          leading: const Icon(Icons.arrow_back,color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: _titleInput,
                        decoration: InputDecoration(
                            labelText: "Title",
                            hintText: 'add the title',
                            labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          errorText: _validataTask ? 'Title Value Can\'t Be Empty' : null,
                        )
            
                    ),
            
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: _subtitleInput,
                        decoration: InputDecoration(
                            labelText: "Subtitle",
                            hintText: 'add the subtitle',
                            labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          errorText: _validataSubtitle ? 'subtitle Value Can\'t Be Empty' : null,
                        )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                        controller: _dateInput,
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
                              _dateInput.text = modifiedDate.toString();
                            });
                          }
                          else
                          {
                            print("not selected");
                          }
                        },
            
                        decoration: InputDecoration(
                            labelText: "Date",
                            hintText: 'select the date',
                            labelStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                          errorText: _validataDate ? 'Date Value Can\'t Be Empty' : null,
                        )
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(onPressed: (){
                        _titleInput.text = '';
                         _subtitleInput.text = '';
                        _dateInput.text = '';
                      },
                        child: const Text("clear",style: TextStyle(color: Colors.white,fontSize: 17),),
                        color: Colors.red[800],
                      ),
                      SizedBox(width: 20,),
                      MaterialButton(onPressed: () async{
                          setState(() {
                            _titleInput.text.isEmpty?_validataTask = true : _validataTask = false;
                            _subtitleInput.text.isEmpty?_validataSubtitle = true : _validataSubtitle = false;
                            _dateInput.text.isEmpty?_validataDate = true : _validataDate = false;
                          });
            
                          if(_validataTask == false && _validataSubtitle == false && _validataDate == false)
                          {
                            //print("good data can save");
                            var _user = User();
                            _user.title = _titleInput.text;
                            _user.subtitle = _subtitleInput.text;
                            _user.date = _dateInput.text;
                            var result = await _UserServices.SaveUser(_user);
                            print(result);
                          }
                      },
                        child: const Text("add",style: TextStyle(color: Colors.white,fontSize: 17),),
                        color: Colors.teal[800],)
                    ],
                  )
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
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
            });
          }
          else if(index == 1)
          {
              const addTask();
          }
          else
          {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
            });
          }
        },
      ),
    )
    );
  }
}
