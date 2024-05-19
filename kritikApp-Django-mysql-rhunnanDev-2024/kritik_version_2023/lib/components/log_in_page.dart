import 'package:flutter/material.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log in",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  "assets/images/kritiklogo.png",
                  //height: 100,
                  // width: 200
                  ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                        //controller: textController,
                        decoration: InputDecoration(
                          labelText: 'Enter Gmail',
                          border: OutlineInputBorder(),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                                     foregroundColor:
                                     MaterialStateProperty
                                     .all<Color>(
                                       Colors.white),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                        const Color.fromARGB(
                                                            255, 239, 175, 80),
                                                      ),
                                                      shape: MaterialStateProperty
                                                          .all<
                                                              RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          side:
                                                              const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          239,
                                                                          175,
                                                                          80)),
                                                        ),
                                                      ),
                                                    ),
                 child: 
                    const Text(
                          'Log in',
                          style: TextStyle(
                          fontSize: 18.0,
                          fontWeight:
                          FontWeight.bold),
                        ),
                 )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
