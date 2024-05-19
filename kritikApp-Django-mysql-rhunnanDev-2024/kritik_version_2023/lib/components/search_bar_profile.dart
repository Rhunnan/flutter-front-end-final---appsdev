import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kritik_version_2023/components/profile_page.dart';
import 'package:provider/provider.dart';

class SearchBarAndProfile extends StatefulWidget {
  const SearchBarAndProfile({super.key});

  @override
  State<SearchBarAndProfile> createState() => _SearchBarAndProfileState();
}

class _SearchBarAndProfileState extends State<SearchBarAndProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                          bottom: BorderSide(width: 1.0, color: Colors.black))),
                  child: const Text(
                    "Cebu, Philippines",
                    style: TextStyle(fontSize: 17),
                  )),
            ),
            Container(
              height: 43,
              width: 43,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                SvgPicture.asset("assets/images/searchIcon.svg"),
                const Padding(
                  padding: EdgeInsets.only(top: 20, right: 30),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 70,
                      width: 220,
                      child: TextField(
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 136, 129, 129)),
                        decoration: InputDecoration(
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
    );
  }
}
