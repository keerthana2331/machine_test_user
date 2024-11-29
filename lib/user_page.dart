// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<UserModel>(
              builder: (context, userModel, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${userModel.name}',
                        style: TextStyle(fontSize: 18)),
                    Text('Email: ${userModel.email}',
                        style: TextStyle(fontSize: 18)),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Update Details:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            UpdateUserForm(),
          ],
        ),
      ),
    );
  }
}

class UpdateUserForm extends StatefulWidget {
  @override
  UpdateUserFormState createState() => UpdateUserFormState();
}

class UpdateUserFormState extends State<UpdateUserForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Provider.of<UserModel>(context, listen: false)
                    .updateUser(nameController.text, emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User details updated')),
                );
              }
            },
            child: const Text('Update User'),
          ),
        ],
      ),
    );
  }
}
