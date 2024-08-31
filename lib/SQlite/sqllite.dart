import 'package:flutter/material.dart';
import 'Database.dart';// Import your DatabaseHelper class

class CrudPageSQLite extends StatefulWidget {
  @override
  _CrudPageSQLiteState createState() => _CrudPageSQLiteState();
}

class _CrudPageSQLiteState extends State<CrudPageSQLite> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Function to add a user
  Future<void> _addUser() async {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      // Show an error message
      return;
    }
    await _dbHelper.insert({
      DatabaseHelper.columnName: _nameController.text,
      DatabaseHelper.columnAge: int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
  }

  // Function to update a user
  Future<void> _updateUser(int id) async {
    if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
      // Show an error message
      return;
    }
    await _dbHelper.update({
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: _nameController.text,
      DatabaseHelper.columnAge: int.parse(_ageController.text),
    });
    _nameController.clear();
    _ageController.clear();
  }

  // Function to delete a user
  Future<void> _deleteUser(int id) async {
    await _dbHelper.delete(id);
  }

  // Function to show a dialog for adding/updating
  void _showUserDialog({int? id, String? name, int? age}) {
    if (id != null) {
      // If ID is not null, update the text fields
      _nameController.text = name!;
      _ageController.text = age!.toString();
    } else {
      _nameController.clear();
      _ageController.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(id != null ? 'Update User' : 'Add User'),
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
              if (_nameController.text.isEmpty || _ageController.text.isEmpty) {
                // Show a validation error
                return;
              }
              if (id != null) {
                _updateUser(id);
              } else {
                _addUser();
              }
              Navigator.of(context).pop();
            },
            child: Text(id != null ? 'Update' : 'Add'),
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
      appBar: AppBar(title: Text('CRUD with SQLite')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _dbHelper.queryAllRows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final rows = snapshot.data!;

          return ListView.builder(
            itemCount: rows.length,
            itemBuilder: (context, index) {
              final row = rows[index];
              return ListTile(
                title: Text(row[DatabaseHelper.columnName]),
                subtitle: Text('Age: ${row[DatabaseHelper.columnAge]}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showUserDialog(
                        id: row[DatabaseHelper.columnId],
                        name: row[DatabaseHelper.columnName],
                        age: row[DatabaseHelper.columnAge],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteUser(row[DatabaseHelper.columnId]),
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
