import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/fetch_data.dart';
import 'package:kritik_version_2023/components/googleMapPage.dart';
import 'package:kritik_version_2023/components/log_in_page.dart';
import 'package:kritik_version_2023/components/services.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

bool isLoggedin = false;

class EstablishmentProfile extends ConsumerStatefulWidget {
  final Establishment establishment;
  const EstablishmentProfile({required this.establishment, super.key});

  @override
  EstablishmentProfileState createState() => EstablishmentProfileState();
}

class EstablishmentProfileState extends ConsumerState<EstablishmentProfile> {
  TextEditingController textController = TextEditingController();
  // final EstablishmentService _establishmentService = EstablishmentService();

//kani nga function mao ni paras show alert dialog sa mga reviews kong i click tong iconbutton nga naas  pra review na button then mogawas
//ni kay mao ni para option sa edit or delete

  void showAlertDialog(int index) {
    // set up the buttons
    TextEditingController controlText = TextEditingController();
    //mao ni button para edit
    Widget editTextButton = TextButton(
      child: Text("Confirm Edit"),
      onPressed: () {
        //ibutang diri ang ufnction nga par edit sa reviews
        // _establishmentService.editReview(
        //     index,
        //     widget.establishment.reviews[index],
        //     controlText,
        //     widget.establishment);
        ref.read(reviewsProvider).editReview(index, controlText.text);
        ref.refresh(reviewsProvider);
        textController.clear();
        Navigator.pop(context);
      },
    );

    Widget deleteButton = TextButton(
      child: Text("Delete"),
      onPressed: () {
        ref.read(reviewsProvider).deleteReview(index);
        ref.refresh(reviewsProvider);
        //ibutang diri ang ufnction nga par delete sa review

        // _establishmentService.deleteReview(
        //   widget.establishment.reviews[index],
        //   widget.establishment,
        // );
        Navigator.pop(context);
      },
    );

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget editButton = TextButton(
      child: Text("Edit"),
      onPressed: () {
        Navigator.pop(context);

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Edit Review'),
                content: TextField(
                  controller: controlText,
                  decoration:
                      InputDecoration(hintText: "Edit your Comment here"),
                ),
                actions: [cancelButton, editTextButton],
              );
            });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Options"),
      actions: [deleteButton, editButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//STARTING RON DKO MALIBOG HAHHAHAHAH TAAS NKAY ANG CODE
  @override
  Widget build(BuildContext context) {
    final reviewsDataDisplay = ref.watch(reviewsDataProvider);
    return Scaffold(
        body: SlidingUpPanel(
      //background of teh sliding panel
      body: Column(
        children: [
          Container(
            width: 360,
            height: 455,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.establishment.pathImage),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 300,
            width: 300,
          )
        ],
      ),
      //properties of the sliding panel
      maxHeight: 700, //maxheight
      minHeight: 410, //deafult height or height when close
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      panelBuilder: (controller) => SizedBox(
        width: 360,
        height: 450,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 10),
            child: SizedBox(
              width: 310,
              height: 50,
              child: Text(
                widget.establishment.name,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/stars.png",
                  height: 30,
                ),
                const Text(
                  "5.0",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
          Center(
              child: SizedBox(
            height: 90,
            width: 320,
            child: Text(
              widget.establishment.description,
              style: const TextStyle(fontSize: 11),
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(right: 165, top: 5),
            child: Text(
              "Explore The Area",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoogleMapPage()),
              );
            },
            child: SizedBox(
                height: 120,
                width: 346,
                child: Image.asset(
                  "assets/images/mapClickable.png",
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 285),
            child: Text(
              "Address:",
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 225),
            child: Text(
              widget.establishment.address,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0),
            child: Center(
              child: Text("Reviews",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            height: 286,
            width: 360,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(
                height: 286,
                width: 360,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 175, 64),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 190, top: 20, bottom: 10),
                      child: Text(
                        "KRITIK says...",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                        height: 100,
                        width: 330,
                        child: Text(
                          "${widget.establishment.name} is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
                          style: const TextStyle(fontSize: 9),
                        )),
                    //for sentiment SCore
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 50),
                          child: Text("Positive Sentiment Score",
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Color.fromARGB(255, 246, 92, 174))),
                        ),
                        Text(
                          "Negative Sentiment Score",
                          style: TextStyle(
                              fontSize: 9,
                              color: Color.fromARGB(255, 92, 148, 246)),
                        )
                      ],
                    ),
                    //for percentage
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 60, right: 100),
                            child: Text("87%",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 246, 92, 174))),
                          ),
                          Text("23%",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 92, 148, 246)))
                        ],
                      ),
                    ),
                    //for pros and cons
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 90, left: 55),
                            child: Text("Pros>",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 246, 92, 174))),
                          ),
                          Text("Cons>",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 92, 148, 246)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 286,
                width: 360,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 231, 228, 228),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 260.0,
                      ),
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled:
                                    true, // I Set this  to true to allow the content to take more than half of the screen, because bottom sheet max height is only half scfreen
                                builder: (context) {
                                  return Container(
                                    height: 640,
                                    width: 360,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                        color: Color.fromARGB(
                                            255, 6, 164, 207)), //
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 280),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                                "assets/images/xbutton.png"),
                                          ),
                                        ),

                                        const Padding(
                                          padding:
                                              EdgeInsets.only(top: 30, left: 8),
                                          child: Text(
                                            "What do you think ?",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Image.asset(
                                            "assets/images/starRatingEmpty.png"),

                                        SizedBox(
                                          height: 100,
                                          width: 300,
                                          child: TextField(
                                            controller: textController,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 136, 129, 129)),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'Share your thoughts...',
                                                hintStyle: TextStyle(
                                                    fontSize: 17.5,
                                                    color: Colors.white30)),
                                          ),
                                        ),

                                        //kani kay ang bottomsheet para add sa reviews na part
                                        SizedBox(
                                          height: 400,
                                          width: 600,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 250, bottom: 20),
                                                child: SizedBox(
                                                  height: 50,
                                                  width: 280,
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
                                                          // Border color
                                                        ),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      'Add Photos',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                                width: 280,
                                                child: TextButton(
                                                  onPressed: () {
                                                    // put the kuan here the new service to add review
                                                    // widget.establishment;
                                                    if (textController
                                                        .text.isEmpty) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return const AlertDialog(
                                                              title: Text(
                                                                  "Warning!!!"),
                                                              content: Text(
                                                                  "Empty TextFields"),
                                                            );
                                                          });
                                                    } else {
                                                      ref
                                                          .read(reviewsProvider)
                                                          .createReview(
                                                              textController
                                                                  .text,
                                                              widget
                                                                  .establishment
                                                                  .id);
                                                      // Reviews(
                                                      //     id: 10,
                                                      //     reviewComment:
                                                      //         textController
                                                      //             .text,
                                                      //     starRating: 5,
                                                      //     imagePath:
                                                      //         "assets/images/profile1.png",
                                                      //     userId: 1,
                                                      //     establishmentId: 1);
                                                      ref.refresh(
                                                          reviewsProvider);
                                                      Navigator.pop(context);
                                                      textController.clear();

                                                      if (!isLoggedin) {
                                                        Navigator
                                                            .pushReplacement(
                                                          // Mo adto sa log in page
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const LogInPage()),
                                                        );
                                                        isLoggedin = true;
                                                      }
                                                    }
                                                  },
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    249,
                                                                    96,
                                                                    85)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    shape: MaterialStateProperty
                                                        .all<
                                                            RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        side: const BorderSide(
                                                            color:
                                                                Colors.white),
                                                        // Border color
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'ADD REVIEW',
                                                    style: TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: SizedBox(
                              width: 50,
                              height: 50,
                              child:
                                  Image.asset("assets/images/plusButton.png"))),
                    ), //reviewss partss
                    reviewsDataDisplay.when(
                        data: (reviews) {
                          List<Reviews> reviewsList = reviews
                              .map((e) => e)
                              .where((element) =>
                                  element.establishmentId ==
                                  widget.establishment.id)
                              .toList();
                          print("\n\n\n\n\n lenght of reviewlist");
                          print(widget.establishment.id);
                          print(reviewsList.length);

                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20),
                            child: SizedBox(
                                height: 215,
                                width: 360,
                                child: ListView.builder(
                                  controller: controller,
                                  itemCount: reviewsList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Column(
                                        children: [
                                          //profile image part of the review, star rating and name
                                          Row(
                                            children: [
                                              Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            reviewsList[index]
                                                                .imagePath))),
                                              ),
                                              //names and star rating
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 30),
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 100,
                                                      child: Text(
                                                        (reviewsList[index]
                                                            .starRating
                                                            .toString()),
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                      "assets/images/starRatingFilled.png"),
                                                ],
                                              ),
                                              //para edit nga function og delete or button
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70),
                                                child: IconButton(
                                                  iconSize: 25,
                                                  icon: const Icon(Icons.edit),
                                                  onPressed: () {
                                                    showAlertDialog(
                                                        reviewsList[index].id);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          //review or the comment of the user
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, right: 30),
                                            child: SizedBox(
                                              width: 300,
                                              child: Text(reviewsList[index]
                                                  .reviewComment),
                                            ),
                                          ),
                                          Row(children: [
                                            SizedBox(
                                              height: 100,
                                              width: 300,
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      width: 100,
                                                      child: Image.asset(
                                                        "assets/images/chowi.png",
                                                        height: 70,
                                                        width: 100,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      width: 100,
                                                      child: Image.asset(
                                                        "assets/images/chowi.png",
                                                        height: 70,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: SizedBox(
                                                      height: 70,
                                                      width: 100,
                                                      child: Image.asset(
                                                        "assets/images/chowi.png",
                                                        height: 70,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ])
                                        ],
                                      ),
                                    );
                                  },
                                )),
                          );
                        },
                        error: (error, s) =>
                            Text("${error.toString()} naay error "),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ))
                  ],
                ),
              )
            ]),
          )
        ]),
      ),
    ));
  }
}

// class PanelScrollableWidget {}
