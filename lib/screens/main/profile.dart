import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../repository/user_repository.dart';
import '../../response/user_response.dart';
import '../../utils/controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserName uname = Get.put(UserName());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserResponse>(
      future: UserRepository().userInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            UserResponse userResponse = snapshot.data!;
            final userName = userResponse.username;
            uname.addName(userName);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      color: Colors.teal,
                      child: Text(
                        'User Details',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.deepOrange,
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      userResponse.username!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userResponse.email!,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          height: 210,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            children: const [
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Account",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Profile"),
                              ),
                              ListTile(
                                leading: Icon(Icons.star),
                                title: Text("Star Items"),
                              ),
                              ListTile(
                                leading: Icon(Icons.notifications),
                                title: Text("Notifications"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        Container(
                          height: 160,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Themes"),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 5, primary: Colors.redAccent),
                                  onPressed: () async {
                                    await Hive.box('login').clear();
                                    AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                        channelKey: 'Basic',
                                        id: 1,
                                        title: 'ProGulf',
                                        body: 'User Logged Out',
                                      ),
                                    );
                                    Navigator.of(context)
                                        .popAndPushNamed('/login');
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.logout),
                                        Text("Logout"),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("No data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
      },
    );
  }
}
