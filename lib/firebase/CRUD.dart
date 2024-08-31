import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  // Function to add a user
  Future<void> _addUser() async {
    await _usersCollection.add({
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
  }

  // Function to update a user
  Future<void> _updateUser(DocumentSnapshot doc) async {
    await _usersCollection.doc(doc.id).update({
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
  }

  // Function to delete a user
  Future<void> _deleteUser(DocumentSnapshot doc) async {
    await _usersCollection.doc(doc.id).delete();
  }

  // Function to show a dialog for adding/updating
  void _showUserDialog({DocumentSnapshot? doc}) {
    if (doc != null) {
      // If document is not null, update the text fields
      _nameController.text = doc['name'];
      _ageController.text = doc['age'].toString();
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(doc != null ? 'Update User' : 'Add User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (doc != null) {
                _updateUser(doc);
              } else {
                _addUser();
              }
              Navigator.of(context).pop();
            },
            child: Text(doc != null ? 'Update' : 'Add'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD with Firestore')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return ListTile(
                title: Text(doc['name']),
                subtitle: Text('Age: ${doc['age']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showUserDialog(doc: doc),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteUser(doc),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
