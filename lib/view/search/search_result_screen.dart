import 'package:resq_connect/view/userflow/public_side/bottomNav/bottom_nav_bar_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 39.h,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const BottomNavBarPublic();
                }));
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(173, 172, 172, 1),
                  blurRadius: 20,
                  offset: Offset(0, 6))
            ], borderRadius: BorderRadius.circular(15), color: Colors.white),
            height: 53.h,
            margin: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
            ),
            child: TextFormField(
              style: const TextStyle(backgroundColor: Colors.white),
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.filter_list_outlined,
                  color: Colors.black,
                ),
                hintText: "Search communities ",
                hintStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w200),
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          const Center(child: Text("Search results ")),
        ],
      ),
    );
  }
}
