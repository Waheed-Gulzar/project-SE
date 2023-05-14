import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Fruit {
  final String name;
  final double price;
  final double weight;
  final File? image;

  Fruit({
    required this.name,
    required this.price,
    required this.weight,
    this.image,
  });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Fruit> items = [     ];

  String _searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        backgroundColor: Color(0xFF008000),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _searchKeyword = value.toLowerCase();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (_searchKeyword.isNotEmpty &&
                    !items[index].name.toLowerCase().contains(_searchKeyword)) {
                  return Container();
                }
                return ListTile(
                  title: Text(items[index].name),
                  subtitle: Text("Price: Rs ${items[index].price}, Weight: ${items[index].weight} Kg"),
                  leading: items[index].image != null ? CircleAvatar(backgroundImage: FileImage(items[index].image!)) : null,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final newFruit = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        String _name = '';
        double _price = 0;
        double _weight = 0;
        File? _imageFile;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SimpleDialog(
              title: Text("Add Fruit"),
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Fruit Name",
                  ),
                  onChanged: (text) {
                    _name = text;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _price = double.tryParse(text) ?? 0;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Weight",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    _weight = double.tryParse(text) ?? 0;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.photo),
                      label: Text("Choose Image"),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
                        if (result != null && result.files.single.size < 5 * 1024 * 1024) {
                          setState(() {
                            _imageFile = File(result.files.single.path!);
                          });
                        }
                      },
                    ),
                    if (_imageFile != null)
                      Image.file(_imageFile!, height: 50, width: 50),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                 child: Text("Add"),
                  onPressed: () {
                  if (_name.isNotEmpty && _price > 0 && _weight > 0 && _imageFile != null) {
                  Navigator.pop(context, {
                   'name': _name,
                   'price': _price,
                   'weight': _weight,
                   'image': _imageFile
                 }
               );
               } else {
                ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                 content: Text("Please enter all fields and choose an image"),
                ),
               );
             }
           },
          ),

              ],
            );
          },
        );
      },
    );
    if (newFruit != null) {
      setState(() {
        items.add(
          
          Fruit(
            name: newFruit['name'],
            price: newFruit['price'],
            weight: newFruit['weight'],
            image: newFruit['image'],
          ),
        );
      });
    }
  },
  child: Icon(Icons.add),
  
),
    );
  }
}
