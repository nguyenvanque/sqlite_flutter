import 'package:flutter/material.dart';
import 'package:sqlite_flutter/data/dbHelper.dart';
import 'package:sqlite_flutter/model/Product.dart';


class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  var dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Yeni Urun Ekleme",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 20, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildDescriptionField(),
              buildUnitPriceField(),
              buildSavebutton(),
            ],
          ),
        ));
  }

  Widget buildNameField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Urunun Adi : ",
      ),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Urunun Aciklamasi : ",
      ),
      controller: txtDescription,
    );
  }

  Widget buildUnitPriceField() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Urunun Fiyati : ",
      ),
      controller: txtUnitPrice,
    );
  }

  Widget buildSavebutton() {
    return ElevatedButton(
      child: const Text(
        "Ekle",
         style: TextStyle(
            fontWeight: FontWeight.w900, fontSize: 20, color: Colors.red),
      ),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        id:null,
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.parse(txtUnitPrice.text)));
    Navigator.pop(context, true);
  }
}