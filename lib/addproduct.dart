import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task1/product_model.dart';
import 'package:task1/shoping.dart';
// import 'package:image_picker/image_picker.dart';
class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {

  var productname;
  var productprice;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? image;
  // final ImagePicker _picker = ImagePicker();
  //
  //
  // // Function to pick image from gallery
  // Future<void> _pickImageFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       image = File(pickedFile.path); // Store the image in _image
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your product name';
                  }
                  return null;
                },
                onSaved: (value) => productname = value,
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Product price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your produt price';
                  }
                  return null;
                },
                onSaved: (value) => productprice = value,
              ),
              if(image!=null)
              Image.file(image!),
              ElevatedButton(onPressed: (){
                // _pickImageFromGallery();
              }, child: Text('Image')),

              ElevatedButton(onPressed: (){
                productList.add(ProductModel(name: nameController.text??'',price: priceController.text));
                Navigator.of(context).pop(true);
              }, child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
