// import "package:kritik_version_2023/components/classEstablishment.dart";
// import "package:kritik_version_2023/components/services.dart";

// ReviewService reviewService = ReviewService();
// adding() {
//   reviewService.addItem(Reviews("Rhunnan", "Chowi have the best food in town",
//       20, "assets/images/chowi.png", "Chowi"));
// }

// //for initial users
// List<User> users = [];
// //for initial reviews
// List<Reviews> reviews = [];
// //OOP list style
// List<Establishment> establishmentData = [
//   Establishment(
//       "assets/images/chowi.png",
//       "Chowi",
//       "Tabunok, Cebu",
//       "Restaurant",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       reviews: [
//         Reviews("Rhunnan", "Chowi have the best food in town", 20,
//             "assets/images/rhuns.jpg", "Chowi"),
//         Reviews("Hugh", "Chowi have the best food in town", 20,
//             "assets/images/hughs.jpg", "Chowi"),
//         Reviews("Kurt", "Chowi have the best food in town", 20,
//             "assets/images/kurts.jpg", "Chowi"),
//       ]),
//   Establishment(
//       "assets/images/profile.png",
//       "Jollibee",
//       "Tabunok, Cebu",
//       "Restaurant",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Jollibee"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Jollibee"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Jollibee")
//       ]),
//   Establishment(
//       "assets/images/beach.jpg",
//       "BoraBora",
//       "Tabunok, Cebu",
//       "Beach",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "BoraBora"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "BoraBora"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "BoraBora")
//       ]),
//     Establishment(
//       "assets/images/kitkats.jpg",
//       "Kitkats",
//       "Tabunok, Cebu",
//       "Hotels",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Kitkats"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Kitkats"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Kitkats")
//       ]),
//     Establishment(
//       "assets/images/shakeys.jpg",
//       "Shakeys",
//       "Tabunok, Cebu",
//       "Restaurant",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Shakeys"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Shakeys"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Shakeys")
//       ]),
//     Establishment(
//       "assets/images/ahmes.jpg",
//       "R Cove",
//       "Tabunok, Cebu",
//       "Beach",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "R Cove"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "R Cove"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "R Cove")
//       ]),
//     Establishment(
//       "assets/images/ninosinn.jpg",
//       "Ninos Inn",
//       "Tabunok, Cebu",
//       "Hotels",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Ninos Inn"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Ninos Inn"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Ninos Inn")
//       ]),
//     Establishment(
//       "assets/images/shangrila.jpg",
//       "ShangriLa",
//       "Tabunok, Cebu",
//       "Hotels",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "ShangriLa"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "ShangriLa"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "ShangriLa")
//       ]),
//     Establishment(
//       "assets/images/lemonbeach.jpg",
//       "Lemon Beach",
//       "Cebu",
//       "Beach",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Lemon Beach"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Lemon Beach"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Lemon Beach")
//       ]),
//     Establishment(
//       "assets/images/kurtspalace.jpg",
//       "Kurts home",
//       "Danao, Cebu",
//       "Hotels",
//       "Welcome to Uncle Brew, where the art of coffee meets an unforgettable vibe, creating a haven for coffee enthusiasts and those seeking a cozy escape. At Uncle Brew, we redefine the coffee experience with a blend of exceptional brews and an ambiance that feels like a warm embrace",
//       "Basak San Nicolas",
//       "Uncle Brew is a hidden gem that combines exceptional coffee with an inviting ambiance, creating a delightful haven for coffee lovers and social butterflies alike. The rich and diverse menu offers a symphony of flavors, from robust espresso blends to meticulously crafted pour-over selections. Each sip is a journey through the nuances of high-quality beans, expertly brewed by skilled baristas. Users happily commended the ambiance at Uncle Brew, it is a harmonious blend of rustic charm and modern comfort. ",
//       [
//         Reviews("Rhunnan", "Chowi have the best food in town", 5,
//             "assets/images/rhuns.jpg", "Kurts Palace"),
//         Reviews("Hugh", "Chowi have the best food in town", 5,
//             "assets/images/hughs.jpg", "Kurts Palace"),
//         Reviews("Kurt", "Chowi have the best food in town", 5,
//             "assets/images/kurts.jpg", "Kurts Palace")
//       ]),
// ];
