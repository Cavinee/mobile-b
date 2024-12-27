import 'package:flutter/material.dart';
import 'package:pertemuan_6/model/user.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Consumer<User>(
        builder: (context, user, child) {
          String firstName = user.firstName;
          String lastName = user.lastName;
          String hobby = user.hobby;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("First Name: $firstName", style: const TextStyle(fontSize: 20.0)),
                Text("Last Name: $lastName", style: const TextStyle(fontSize: 20.0)),
                Text("Hobby: $hobby", style: const TextStyle(fontSize: 20.0)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit');
                  },
                  child: const Text("Edit Profile"),
                )
              ],
            ),
          );
        },
      )
    );
  }
}