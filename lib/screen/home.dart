import 'package:flutter/material.dart';
import 'package:yummly_ui/explore.dart';
import 'package:yummly_ui/screen/favourites.dart';
import 'package:yummly_ui/screen/justforyou.dart';
import 'package:yummly_ui/screen/radio.dart';
import 'package:yummly_ui/screen/pengaturan.dart';
import 'package:yummly_ui/screen/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Image.asset('assets/images/logo.png', height: 99.0, width: 100.0),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(children: [
          SizedBox(
            height: 0,
          ),
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: "Just For You".toUpperCase(),
              ),
              Tab(
                text: "Explore Recipes".toUpperCase(),
              ),
              Tab(
                text: "Favourites".toUpperCase(),
              ),
            ],
            unselectedLabelColor: Colors.black.withOpacity(0.3),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                JustForYou(),
                Explore(),
                Favourites(),
              ],
            ),
          )
        ]),
      )),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Search();
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.search)),
                onPressed: () {}),
            IconButton(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Pengaturan();
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.person)),
                onPressed: () {}),
            IconButton(icon: const Icon(Icons.list), onPressed: () {}),
            IconButton(
                icon: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return radio();
                          },
                        ),
                      );
                    },
                    child: const Icon(Icons.radio)),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
