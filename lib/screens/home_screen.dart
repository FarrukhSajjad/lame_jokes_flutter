import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String jokeType = 'Any';

  Future getJoke() async {
    var url = 'https://v2.jokeapi.dev/joke/$jokeType?format=txt';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      if (joke == null) {
        setState(() {
          joke = response.body;
        });
      }
    }
  }

  String joke = 'Joke Here...';
  String appBarTitle = 'Lame Jokes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle,
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.star_border_outlined,
            ),
            onPressed: () {
              launch('https://github.com/FarrukhSajjad/lame_jokes_flutter');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //  color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4.0,
                      right: 4.0,
                    ),
                    child: joke == null
                        ? CircularProgressIndicator()
                        : SelectableText(
                            joke,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        joke = null;
                        jokeType = 'Any';
                        appBarTitle = 'Lame Jokes';
                      });
                      getJoke();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.lightBlue.shade600),
                          bottom: BorderSide(color: Colors.lightBlue.shade600),
                          left: BorderSide(color: Colors.lightBlue.shade900),
                          right: BorderSide(color: Colors.lightBlue.shade900),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Tap for a random joke...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return;
                  },
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      JokeType(
                        type: 'Programming',
                        onTap: () {
                          setState(() {
                            joke = null;
                            jokeType = 'Programming';
                            appBarTitle = 'Programming Jokes';
                          });
                          getJoke();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      JokeType(
                        type: 'Dark',
                        onTap: () {
                          setState(() {
                            joke = null;
                            jokeType = 'Dark';
                            appBarTitle = 'Dark Jokes';
                          });
                          getJoke();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      JokeType(
                        type: 'Pun',
                        onTap: () {
                          setState(() {
                            joke = null;
                            jokeType = 'Pun';
                            appBarTitle = 'Puns';
                          });
                          getJoke();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      JokeType(
                        type: 'Spooky',
                        onTap: () {
                          setState(() {
                            joke = null;
                            jokeType = 'Spooky';
                            appBarTitle = 'Spooky';
                          });
                          getJoke();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      JokeType(
                        type: 'Christmas',
                        onTap: () {
                          setState(() {
                            joke = null;
                            jokeType = 'Christmas';
                            appBarTitle = 'Christmas Jokes';
                          });
                          getJoke();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JokeType extends StatelessWidget {
  final String type;
  final Function onTap;
  JokeType({this.type, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              type,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
