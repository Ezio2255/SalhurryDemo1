import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salhurry/presentation/constants/const.dart';
import 'package:salhurry/presentation/login%20page/login.dart';
import 'package:salhurry/signpages/welcome_screen.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                auth.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              }),
        ],
        title: const Text(
          'profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 5, 80),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: height * .16 - height * .07,
                ),
                child: Container(
                  color: Colors.grey,
                  height: height * .16,
                  width: double.infinity,
                  child: Image.network(
                    "https://vowels.co.in/blog/wp-content/uploads/2021/09/Basic-Introduction-To-Art-And-Illustration-Graphic-Design.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: height * .16 - height * .07,
                child: CircleAvatar(
                  radius: height * .07,
                  backgroundImage: const NetworkImage(
                      "https://i.pinimg.com/564x/44/67/c7/4467c7b20cb2e574e76266a6f40c8201.jpg"),
                ),
              )
            ],
          ),
          const Center(child: Text("Kasi's profile")),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About"),
                khbox5,
                Text(
                    "Versatile professional seeking part-time opportunities. Proficient in various domains, with a keen eye for detail and efficiency. "),
                khbox5,
                Text("Top Skills"),
                khbox5,
                Wrap(
                  runSpacing: 16,
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        WidgetSkillContainer(text: "Language"),
                    
                        WidgetSkillContainer(text: "hg"),
                        WidgetSkillContainer(text: "communication"),
                                                WidgetSkillContainer(text: "communication"),

                        WidgetSkillContainer(text: "Language"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
  // Widget buildCoverArea(){
  //   return
  // }
}

class WidgetSkillContainer extends StatelessWidget {
  const WidgetSkillContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ),
        kwbox10,
      ],
    );
  }
}