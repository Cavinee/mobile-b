import 'package:flutter/material.dart';
import 'package:pertemuan_6/model/user.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final hobbyController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    hobbyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    hobbyController.text = user.hobby;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                )
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                )
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your hobby name";
                  }
                  return null;
                },
                controller: hobbyController,
                decoration: InputDecoration(
                  labelText: 'Hobby',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
                )
              ),
              const SizedBox(height: 15.0),
              ElevatedButton(
                child: const Text("Save Changes"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    user.changeProfile(firstNameController.text, lastNameController.text, hobbyController.text);

                    const snackBar = SnackBar(
                      content: Text("Successfully updated")
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                },
              )
            ],
          ),
        )
      ),
    );
  }
}