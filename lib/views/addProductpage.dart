import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/ingredientTile.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String dropdownValue = "Kilo";
  late Future<XFile?> pickedFile = Future.value(null);
  final picker = ImagePicker();
  var file = File("");
  var ingredients = [];
  final _ingredientsText = TextEditingController();
  final _nameText = TextEditingController();
  final _descriptionText = TextEditingController();
  final _priceText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        pickedFile = picker
                            .pickImage(
                                source: ImageSource.gallery,
                                maxHeight: 1080,
                                maxWidth: 1080)
                            .whenComplete(() => {setState(() {})});
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        child: FutureBuilder(
                          future: pickedFile,
                          builder: (context, AsyncSnapshot<XFile?> snapshot) {
                            if (!snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: 80,
                                  ),
                                  Text(
                                    "Add a photo",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              );
                            }
                            if (snapshot.hasData) {
                              file = File(snapshot.data!.path);
                              return SizedBox(
                                child: Image.file(
                                  File(snapshot.data!.path),
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameText,
                        maxLength: 100,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field required";
                          }
                        },
                        decoration:
                            InputDecoration(label: Text("Product name")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _descriptionText,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Field required";
                          }
                        },
                        maxLength: 250,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration:
                            InputDecoration(label: Text("Product description")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              controller: _priceText,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Field required";
                                }
                              },
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: Text("Price"),
                                suffixIcon: DropdownButton<String>(
                                  value: dropdownValue,
                                  elevation: 16,
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>['Kilo', 'Piece']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                              flex: 3,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _ingredientsText,
                                    maxLength: 30,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        label: Text("Ingredients"),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              ingredients
                                                  .add(_ingredientsText.text);
                                              _ingredientsText.text = "";
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        )),
                                  ),
                                  AnimatedSize(
                                    duration: Duration(milliseconds: 200),
                                    child: LimitedBox(
                                      maxHeight: 170,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                          bottom: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.3)),
                                          left: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.3)),
                                          right: BorderSide(
                                              style: BorderStyle.solid,
                                              width: 1,
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.3)),
                                        )),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            reverse: true,
                                            itemCount: ingredients.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                                  onLongPress: () {
                                                    setState(() {
                                                      ingredients
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: IngredientTile(
                                                    name: ingredients[index],
                                                  ),
                                                )),
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            TextButton(
                onPressed: () {
               
                  if (_formKey.currentState!.validate() &&
                      file.path.isNotEmpty) {
                    // await FirebaseFirestore.instance
                    //       .collection("businesses")
                    //       .doc()
                    //       .set(bd.toJson());
                  }
                },
                child: Text("Add Product"))
          ],
        ),
      ),
    );
  }
}
