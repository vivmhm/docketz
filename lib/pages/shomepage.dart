import 'package:docketz/pages/tlineups.dart';
import 'package:flutter/material.dart';
import 'package:docketz/database_helper.dart';
import 'package:docketz/widgets2.dart';
import '../widgets.dart';
import '../widgets2.dart';
class SHomepage extends StatefulWidget {
   @override
  _SHomepageState createState() => _SHomepageState();
}

class _SHomepageState extends State<SHomepage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          color: Color(0xFF6C7E8F),
          child: Stack(
            children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 32.0,
                      right:32.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo4.png'),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTasks(),
                      builder: (context, snapshot) {
                        return ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TLineups(
                                        task: snapshot.data[index],
                                      ),
                                    ),
                                  ).then(
                                        (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                                child: DockWidget2(
                                  title: snapshot.data[index].title,
                                  desc: snapshot.data[index].description,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TLineups(
                            task: null,
                          )),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF2F363B), Color(0xFF2F363B)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Image(
                      image: AssetImage(
                        "assets/images/add_icon.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}