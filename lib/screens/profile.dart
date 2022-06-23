import 'package:flutter/material.dart';

import '../repository/user_repository.dart';
import '../response/user_response.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserResponse?>(
      future: UserRepository().userInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          debugPrint(snapshot.data.toString());
          if (snapshot.data != null) {
            UserResponse userResponse = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.deepOrange,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  userResponse.email!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
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
