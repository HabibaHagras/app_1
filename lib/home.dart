import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:audio_player/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:http/http.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  int current_page = 0;
  final images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU"
  ];
  // final m = [
  //   "a",
  //   "d",
  //   "dd"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:const Text("Home"),
    
      
      ), 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              onPageChanged: (index, _) {
                current_page = index;
                print(index);
                setState() {}
                ;
              },
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),

            itemBuilder: (BuildContext context, int index, int realIndex) {
              final uri_of_images = images[index];
              return Container(
                  margin: EdgeInsets.all(10),
                  //child : Text(uri_of_images)
                   child: Image.network(uri_of_images)
                  
                  
                  );
            },
            itemCount: images.length,
            // items: images.map((i) {
            // return

            //  Builder(builder: (BuildContext context) {
            //   return Container(
            //       margin: EdgeInsets.all(10),
            //       child: Image.network(images[i]));
            // });

            // Builder(
            //   builder: (BuildContext context) {
            //     return Container(
            //         width: MediaQuery.of(context).size.width,
            //         margin: EdgeInsets.symmetric(horizontal: 5.0),
            //         decoration: BoxDecoration(color: Colors.amber),
            //         child: Text(
            //           'text $i',
            //           style: TextStyle(fontSize: 16.0),
            //         ));
            // },
            //   );
            // }).toList(),
          ),
          DotsIndicator(
            dotsCount: images.length,
            position: current_page,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.remove("email");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return LoginPage();
                }));
              },
              child: Text(
                "Logout",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
