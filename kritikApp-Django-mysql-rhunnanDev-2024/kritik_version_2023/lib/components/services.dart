// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import '../components/classEstablishment.dart';

// ReviewService _reviewService = ReviewService();

// class EstablishmentService {
//   final String _boxName = "establishmentBox";

//   Future<Box<Establishment>> get _box async {
//     return await Hive.openBox<Establishment>(_boxName);
//   }

//   Future<void> addItem(Establishment establishment) async {
//     var box = await _box;
//     await box.add(establishment);
//   }

//   Future<List<Establishment>> getAllEstablishment() async {
//     var box = await _box;
//     return box.values.toList();
//   }

//   Future<void> deleteAllEstablishments() async {
//     var box = await _box;
//     await box.clear();
//   }

//   Future<int> getBoxLength() async {
//     var box = await _box;
//     return box.length.toInt();
//   }

//   Future<bool> containsEstablishment(Establishment data) async {
//     var box = await _box;
//     return box.values.contains(data);
//   }

//   Future<void> addReview(Reviews review, Establishment establishment) async {
//     var box = await _box;

//     for (int i = 0; i < box.length; i++) {
//       if (box.values.toList()[i] == establishment) {
//         box.values.toList()[i].reviews.insert(0, review);
//         _reviewService.addItem(review);
//         box.put(i, establishment);
//       }
//     }
//   }

//   Future<void> deleteReview(Reviews review, Establishment establishment) async {
//     var box = await _box;

//     for (var key in box.keys) {
//       var currentEstablishment = box.get(key) as Establishment?;

//       if (currentEstablishment != null &&
//           currentEstablishment == establishment) {
//         // Find the index of the review within the list
//         int reviewIndex = currentEstablishment.reviews.indexOf(review);

//         if (reviewIndex != -1) {
//           // Remove the review from the list
//           currentEstablishment.reviews.removeAt(reviewIndex);
//         }

//         // Save the updated establishment back to the box
//         box.put(key, currentEstablishment);
//       }
//     }
//   }

//   Future<void> editReview(
//     int index,
//     Reviews review,
//     TextEditingController textEditingController,
//     Establishment establishment,
//   ) async {
//     var box = await _box;

//     for (int i = 0; i < box.length; i++) {
//       if (box.values.toList()[i] == establishment) {
//         // Assuming the index is within the range of reviews
//         if (index >= 0 && index < box.values.toList()[i].reviews.length) {
//           // Update the review comment
//           box.values.toList()[i].reviews[index].reviewComment =
//               textEditingController.text;

//           // Save the updated review back to the box
//           box.put(i, box.values.toList()[i]);
//         }
//       }
//     }
//   }
// }

// //reviews serrvices for database hive box

// class ReviewService {
//   final String _boxName = "serviceBox";

//   Future<Box<Reviews>> get _box async {
//     return await Hive.openBox<Reviews>(_boxName);
//   }

//   Future<void> addItem(Reviews review) async {
//     var box = await _box;
//     await box.add(review);
//   }

//   Future<List<Reviews>> getAllReviews() async {
//     var box = await _box;
//     return box.values.toList();
//   }

//   Future<void> deleteAllReviews() async {
//     var box = await _box;
//     await box.clear();
//   }

//   Future<int> getBoxLength() async {
//     var box = await _box;
//     return box.length.toInt();
//   }

//   Future<bool> containsReview(Reviews data) async {
//     // check if ang box naa bay item or data na pariha ani
//     var box = await _box;
//     return box.values.contains(data);
//   }
// }

// //services for the USERS
// class UserService {
//   final String _boxName = "userBox";

//   Future<Box<User>> get _box async {
//     return await Hive.openBox<User>(_boxName);
//   }

//   Future<void> addUser(User user) async {
//     var box = await _box;
//     await box.add(user);
//   }

//   Future<List<User>> getAllUsers() async {
//     var box = await _box;
//     return box.values.toList();
//   }

//   Future<List<Establishment>> getAllBookmarks() async {
//     var box = await _box;
//     if (box.isEmpty) {
//       return []; //since dli man pwede mo retrun og null so retrun kog empty if walay bookmars ron dli mo error
//     }
//     return box.values.first.bookmarks.toList();
//   }

//   Future<User?> getFirstUser() async {
//     var box = await _box;
//     if (box.isEmpty) {
//       return null;
//     }
//     return box.values.first;
//   }

//   Future<void> addToBookmarks(Establishment establishment) async {
//     var box = await _box;

//     if (box.isEmpty) {
//       return; // if empty ang user na box pasabot walay user so dli ka add og bookmark
//     }

//     // chceking if ang bookamrk naana daan aw dli na i add blaik
//     if (!box.values.first.bookmarks.contains(establishment)) {
//       // if wala aw i add sa bookmarks
//       box.values.first.bookmarks.add(establishment);
//       box.put(0, box.values.first);
//     } else {
//       return;
//     }
//   }

//   Future<int> getBoxLength() async {
//     var box = await _box;
//     return box.length.toInt();
//   }
// }
