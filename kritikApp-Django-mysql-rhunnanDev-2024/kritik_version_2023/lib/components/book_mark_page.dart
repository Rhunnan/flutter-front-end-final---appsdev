// import 'package:flutter/material.dart';
// import 'package:kritik_version_2023/components/classEstablishment.dart';
// import 'package:kritik_version_2023/components/establishment_profile.dart';
// import 'package:kritik_version_2023/components/search_bar_profile.dart';
// import 'package:kritik_version_2023/components/services.dart';

// class BookMarkPage extends StatefulWidget {
//   const BookMarkPage({super.key});

//   @override
//   State<BookMarkPage> createState() => _BookMarkPageState();
// }

// class _BookMarkPageState extends State<BookMarkPage> {
//   var restaurants = true;
//   var hotels = false;
//   var beach = false;
//   var populars = false;
//   var explore = false;

//   //putting initial list into the hivebox and from the hive box putting in in  a list nad filtering it
//   final UserService _userService = UserService();

//   late List<Establishment> hotelFilter = [],
//       restaurantFilter = [],
//       beachFilter = [],
//       allEstabFilter = [];
//   @override
//   void initState() {
//     super.initState();
//     hoFilters();
//     restoFilters();
//     beachFilters();
//     allFilters();
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       // Simulate a tap on Restaurants button
//       changeColorNavigation(1);
//     });
//   }

//   Future<void> hoFilters() async {
//     hotelFilter = await _userService.getAllBookmarks().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) => establishment.category.contains("Hotel"))
//             .toList()
//             .cast<Establishment>());
//     print("hotel called");
//     print(hotelFilter.length);

//     setState(() {});
//   }

//   Future<void> allFilters() async {
//     allEstabFilter =
//         await _userService.getAllBookmarks() as List<Establishment>;
//     print("all List of establishments");
//     print(allEstabFilter.length);

//     setState(() {});
//   }

//   Future<void> restoFilters() async {
//     restaurantFilter = await _userService.getAllBookmarks().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) =>
//                 establishment.category.contains("Restaurant"))
//             .toList()
//             .cast<Establishment>());
//     print("restaurant called");
//     print(restaurantFilter.length);

//     setState(() {});
//   }

//   Future<void> beachFilters() async {
//     beachFilter = await _userService.getAllBookmarks().then(
//         (establishmentList) => establishmentList
//             .map((establishment) => establishment)
//             .where((establishment) => establishment.category.contains("Beach"))
//             .toList()
//             .cast<Establishment>());
//     print("beach called");
//     print(beachFilter.length);

//     setState(() {});
//   }

//   Future route(Establishment estabProfile) {
//     return Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               EstablishmentProfile(establishment: estabProfile)),
//     );
//   }

//   List<Establishment> establishmentDataDisplay = [];

//   void changeColorNavigation(int num) {
//     switch (num) {
//       case 1: //for restaurant
//         establishmentDataDisplay = restaurantFilter;
//         setState(() {
//           restaurants = true;
//           hotels = false;
//           beach = false;
//           populars = false;
//           explore = false;
//         });
//         break;
//       case 2: //for hotels
//         establishmentDataDisplay = hotelFilter;
//         setState(() {
//           restaurants = false;
//           hotels = true;
//           beach = false;
//           populars = false;
//           explore = false;
//         });
//         break;

//       case 3: //for nbeach
//         establishmentDataDisplay = beachFilter;
//         setState(() {
//           restaurants = false;
//           hotels = false;
//           beach = true;
//           populars = false;
//           explore = false;
//         });
//         break;

//       case 4: // for populars
//         establishmentDataDisplay = allEstabFilter;
//         setState(() {
//           restaurants = false;
//           hotels = false;
//           beach = false;
//           populars = true;
//           explore = false;
//         });
//         break;

//       case 5: //for explore
//         establishmentDataDisplay = allEstabFilter;

//         setState(() {
//           explore = true;
//           restaurants = false;
//           hotels = false;
//           beach = false;
//           populars = false;
//         });
//         break;
//       default:
//         establishmentDataDisplay = restaurantFilter;

//         setState(() {
//           explore = false;
//           restaurants = true;
//           hotels = false;
//           beach = false;
//           populars = false;
//         });
//     }
//   }

//   ///using this initState to run this functions only once

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 50),
//             child: SearchBarAndProfile(),
//           ),
//           Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 10),
//                 height: 50,
//                 width: 330,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: GestureDetector(
//                           onTap: () {
//                             changeColorNavigation(1);
//                           },
//                           child: restaurants
//                               ? const Text("Restaurants",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.blue))
//                               : const Text("Restaurants",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.black))),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: GestureDetector(
//                           onTap: () {
//                             changeColorNavigation(2);
//                           },
//                           child: hotels
//                               ? const Text("Hotels",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.blue))
//                               : const Text("Hotels",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.black))),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: GestureDetector(
//                           onTap: () {
//                             changeColorNavigation(3);
//                           },
//                           child: beach
//                               ? const Text("Beach",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.blue))
//                               : const Text("Beach",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.black))),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: GestureDetector(
//                           onTap: () {
//                             changeColorNavigation(5);
//                           },
//                           child: explore
//                               ? const Text("Explore",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.blue))
//                               : const Text("Explore",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.black))),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10, right: 10),
//                       child: GestureDetector(
//                           onTap: () {
//                             changeColorNavigation(4);
//                           },
//                           child: populars
//                               ? const Text("Populars",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.blue))
//                               : const Text("Populars",
//                                   style: TextStyle(
//                                       fontSize: 10, color: Colors.black))),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 480,
//                 width: 350,
//                 child:
//                     //establishments grid V
//                     ListView.builder(
//                   // itemCount: EstablishmentGridData.length,
//                   itemCount: establishmentDataDisplay.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         route(establishmentDataDisplay[index]);
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SizedBox(
//                           child: Column(
//                             children: [
//                               //establishment Image
//                               Container(
//                                   height: 150,
//                                   width: 300,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(35),
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               // EstablishmentGridData[index]['path']),
//                                               establishmentDataDisplay[index]
//                                                   .pathImage),
//                                           fit: BoxFit.cover)),
//                                   //bookmark and star rating
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 60, top: 120),
//                                         child: Row(
//                                           children: [
//                                             Image.asset(
//                                                 "assets/images/locationSmallRed.png"),
//                                             Text(
//                                               establishmentDataDisplay[index]
//                                                   .name,
//                                               // EstablishmentGridData[index]['name'],
//                                               style: const TextStyle(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 15),
//                                               child: Text(
//                                                 establishmentDataDisplay[index]
//                                                     .location,
//                                                 // EstablishmentGridData[index]['location'],
//                                                 style: const TextStyle(
//                                                     fontSize: 11,
//                                                     fontWeight:
//                                                         FontWeight.w400),
//                                               ),
//                                             ),
//                                             Image.asset(
//                                                 "assets/images/starRating.png"),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                               //Establishments Name, Location and Location symbol
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
