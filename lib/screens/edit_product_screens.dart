import 'package:flutter/material.dart';

class EditProductScreens extends StatefulWidget {
  const EditProductScreens({super.key});
  static const routeName = "/edit-prod";

  @override
  State<EditProductScreens> createState() => _EditProductScreensState();
}

class _EditProductScreensState extends State<EditProductScreens> {
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Rasim URL-ni kuriting!"),
          content: Form(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Rasim URL",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Bekor qilish"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Saqlash"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/menag_produc");
            },
            icon: const Icon(Icons.dangerous)),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text("Mahsulot Qo'ish"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nomi",
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Naxri",
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Qo'shimcha Malumot",
                      alignLabelWithHint: true),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _showImageDialog(context);
                  },
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 180,
                      width: double.infinity,
                      child: const Text("Asosiy Rasimni URL-ni kiriting !"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
