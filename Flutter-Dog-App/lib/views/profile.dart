import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/action/registers.dart';
import 'package:flutter_firebase_connect/views/home.dart';
import 'package:flutter_firebase_connect/views/regisform.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  profile({Key key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  List profiles = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ActionRegis().getAllRegis().then((result) {
      print(result);
      setState(() {
        profiles = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF214269),
          title: Text('PROFILE'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFE9F1FA),
                Color(0xFFD7E6F7),
                Color(0xFFD7EAFF),
                Color(0xFFD4E8FF),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                        width: 350,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'FirstName:  ${profiles[index]['FirstName']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'LastName:  ${profiles[index]['LastName']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  'Address:  ${profiles[index]['Address']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Phone: ${profiles[index]['Tell']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Email: ${profiles[index]['Email']}'),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(10),
                            //   child: Text(
                            //       'Password: ${profiles[index]['Password']}'),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red[300]),
                                  onPressed: () {
                                    final res = ActionRegis().deleteRegis(
                                        "${profiles[index]['FirstName']}");

                                    print(res);
                                    print('Delete Success');
                                  },
                                  child: Text('delete')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  child: Text('Back')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
