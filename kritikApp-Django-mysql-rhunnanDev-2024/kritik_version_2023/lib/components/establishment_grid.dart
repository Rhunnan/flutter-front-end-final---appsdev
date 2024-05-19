import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/establishment_profile.dart';
import 'package:kritik_version_2023/components/fetch_data.dart';
import 'package:kritik_version_2023/components/profile_page.dart';
import 'package:kritik_version_2023/components/search_bar_profile.dart';
import 'package:kritik_version_2023/components/services.dart';
import 'package:provider/provider.dart';

class EstablishmentsGrid extends ConsumerWidget {
  // ignore: prefer_const_constructors_in_immutables
  EstablishmentsGrid({super.key});

  TextEditingController controllerSearchText = TextEditingController();

  final filterProvider = StateProvider<int>((ref) => 1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // function to route to the page profile
    Future route(Establishment estabProfile) {
      return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EstablishmentProfile(establishment: estabProfile)),
      );
    }

    final filter = ref.watch(filterProvider);
    final establishmentDataDisplay = ref.watch(establishmentDataProvider);
    return establishmentDataDisplay.when(
        data: (establishment) {
          List<Establishment> establishmentList =
              establishment.map((e) => e).toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    //proofile and ciity
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SvgPicture.asset(
                            "assets/images/locationIcon.svg",
                            height: 30,
                            width: 28.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17, right: 10),
                          child: Container(
                              height: 24,
                              width: 245,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black))),
                              child: const Text(
                                "Cebu, Philippines",
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                        Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()),
                              );
                            },
                            child: Image.asset("assets/images/profile1.png"),
                          ),
                        ),
                      ],
                    ),
                    //profile and city ending
                    //search bar starting
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: SizedBox(
                        height: 70,
                        width: 320,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // controllerSearchText.clear();
                                },
                                icon: Icon(Icons.search)),
                            // SvgPicture.asset("assets/images/searchIcon.svg"),
                            Padding(
                              padding: const EdgeInsets.only(top: 20, right: 0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SizedBox(
                                  height: 70,
                                  width: 220,
                                  child: TextField(
                                    controller: controllerSearchText,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 136, 129, 129)),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search',
                                        hintStyle: TextStyle(fontSize: 25)),
                                  ),
                                ),
                              ),
                            ),
                            SvgPicture.asset("assets/images/adjust.svg")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 50,
                width: 330,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {
                            ref.read(filterProvider.notifier).state = 1;
                            // changeColorNavigation(filter);
                          },
                          child: const Text("Restaurants",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {
                            ref.read(filterProvider.notifier).state = 2;
                            // changeColorNavigation(filter);
                          },
                          child: const Text("Hotels",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {
                            ref.read(filterProvider.notifier).state = 3;
                            // changeColorNavigation(filter);
                          },
                          child: const Text("Beach",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                          onTap: () {
                            ref.read(filterProvider.notifier).state = 5;
                            // changeColorNavigation(filter);
                          },
                          child: const Text("Explore",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                          onTap: () {
                            ref.read(filterProvider.notifier).state = 4;
                            // changeColorNavigation(filter);
                          },
                          child: const Text("Populars",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 480,
                  width: 350,
                  child:
                      //establishments grid V
                      SizedBox(
                    height: 600,
                    width: 300,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.80,
                      ),
                      // itemCount: EstablishmentGridData.length,
                      itemCount: establishmentList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // _userService.addToBookmarks(establishmentDataDisplay[index]);
                            route(establishmentList[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  //establishment Image
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              // EstablishmentGridData[index]['path']),
                                              establishmentList[index]
                                                  .pathImage),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                      ),
                                      //bookmark and star rating
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 75.0, top: 7, bottom: 80),
                                            child: Image.asset(
                                                "assets/images/bookmark.png"),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 60),
                                            child: Image.asset(
                                                "assets/images/starRating.png"),
                                          )
                                        ],
                                      )),
                                  //Establishments Name, Location and Location symbol
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/locationSmallRed.png"),
                                        Column(
                                          children: [
                                            Text(
                                              establishmentList[index].name,
                                              // EstablishmentGridData[index]['name'],
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              establishmentList[index].location,
                                              // EstablishmentGridData[index]['location'],
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),
            ],
          );
          //establishments grid V
        },
        error: (error, s) => Text(error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
// pag add og input sa hivebox nya i retrives sa hivebox then i post diri
