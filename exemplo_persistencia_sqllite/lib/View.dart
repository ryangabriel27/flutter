import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:flutter/material.dart';

import 'DatabaseHelper.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper
            .getContacts(), // Obtém a lista de contatos do banco de dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Exibe um indicador de carregamento enquanto os dados estão sendo carregados
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Exibe uma mensagem de erro se ocorrer um erro ao carregar os dados
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
                    'No contacts found.')); // Exibe uma mensagem se não houver contatos encontrados
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data?[index];
                return ListTile(
                  title: Text(contact!.name),
                  subtitle: Text(contact.email),
                  onTap: () {
                    // Implement onTap functionality
                  },
                );
              },
            ); // Exibe a lista de contatos
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddContactDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // Create new contact and insert into database
                ContactModel newContact = ContactModel(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                  addressLine1: addressController.text,
                );
                await dbHelper
                    .create(newContact); // Use create method to insert contact
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _reload() async {
    dbHelper.getContacts();
  }
}
