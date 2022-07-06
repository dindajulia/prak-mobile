import 'package:flutter/material.dart';

class JustForYou extends StatefulWidget {
  const JustForYou({Key? key}) : super(key: key);

  @override
  State<JustForYou> createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.asset(
                  'assets/images/gluten.jpeg',
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Vegan & Gluten-Free",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "OH SHE GLOWS",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 124, 122, 122),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.asset(
                  'assets/images/banana.jpeg',
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Banana Bread",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("WILLIAMS-SONOMA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ))
                      ]),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.asset(
                  'assets/images/chiken.jpeg',
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Chiken Honey",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("GRAN LUCHITO MEXICO",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 124, 122, 122),
                            ))
                      ]),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
