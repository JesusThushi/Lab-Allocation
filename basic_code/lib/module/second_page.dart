import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Second Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text('Image'),
                Image.asset(
                  'assets/images/aa.png',
                  height: 400,
                ),
                Image.network(
                  'https://www.sjp.ac.lk/wp-content/uploads/2019/01/sjp-logo-large-trilingual.png',
                  height: 200,
                ),
                Image.network(
                  'https://www.sjp.ac.lk/wp-content/uploads/2019/01/sjp-logo-large-trilingual.png',
                  height: 200,
                ),
                Image.network(
                  'https://www.sjp.ac.lk/wp-content/uploads/2019/01/sjp-logo-large-trilingual.png',
                  height: 200,
                ),
                Image.network(
                  'https://www.sjp.ac.lk/wp-content/uploads/2019/01/sjp-logo-large-trilingual.png',
                  height: 200,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("go Back"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
