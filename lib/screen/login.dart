import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummly_ui/auth.dart';
import 'package:yummly_ui/dummy_data.dart';
import 'package:yummly_ui/register.dart';
import 'package:yummly_ui/screen/home_api.dart';
import 'package:yummly_ui/services/articles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const Route = '/login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  List<Map<String, dynamic>> dataUser = DummyData.data;
  void getdata() async {
    final prefs = await SharedPreferences.getInstance();
    int? currentid = prefs.getInt('id');

    for (var i = 0; i < dataUser.length; i++) {
      if (currentid != null && currentid == dataUser[i]['id']) {
        prefs.setString('nama', dataUser[i]['nama']);
        prefs.setString('nim', dataUser[i]['Nim']);
        Navigator.pushReplacementNamed(context, '/');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState\
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Image.asset("assets/images/chef.jpeg"),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 128,
                    ),
                    TextField(
                      controller: usernameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 142, 138, 138)),
                        ),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 220, 216, 216)),
                        hintText: 'Username',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 131, 131, 131)),
                        ),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 220, 216, 216)),
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          AuthenticationService service =
                              AuthenticationService(FirebaseAuth.instance);
                          service
                              .signIn(
                                  email: usernameController.text,
                                  password: passwordController.text)
                              .then((value) {
                            if (value) {
                              Navigator.pushReplacementNamed(context, '/');
                            } else {
                              for (var i = 0; i < dataUser.length; i++) {
                                if (usernameController.text ==
                                        dataUser[i]['username'] &&
                                    passwordController.text ==
                                        dataUser[i]['password']) {
                                  prefs.setInt('id', dataUser[i]['id']);
                                  prefs.setString('nama', dataUser[i]['nama']);
                                  prefs.setString('nim', dataUser[i]['Nim']);
                                  Navigator.pushReplacementNamed(context, '/');
                                }
                              }
                            }
                          });
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.grey,
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Consumer<Articles>(
                      builder: (context, article, child) => ButtonRent(
                        onTap: () async {
                          if (await article.login(usernameController.text,
                              passwordController.text)) {
                            Navigator.pushNamed(context, HomeAPI.route);
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(
                                          "Authentication failed, please login again"),
                                    ));
                          }
                        },
                        text: "Continue with Laravel account",
                        color: Colors.white,
                        icon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Register())));
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Y U M M L Y',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 108, 107, 107),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonRent extends StatelessWidget {
  const ButtonRent({
    Key? key,
    this.color = Colors.black,
    required this.onTap,
    required this.text,
    this.icon,
    this.textColor = Colors.black,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color textColor;
  final Widget? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon ?? const Text(""),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
