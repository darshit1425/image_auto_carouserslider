import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_auto_carouserslider/screen/image_slider/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Home_Provider? ProviderT;
  Home_Provider? ProviderF;

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of(context, listen: true);
    ProviderF = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff002381),
        appBar: AppBar(
          backgroundColor: Color(0xff1565C0),

          // backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back,
              // size: 22,
              color: Colors.white),
          title: Text(
            "Sports",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // height: 400,
            // width: 200,
            alignment: Alignment.center,
            // color: Colors.white,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Image.asset(
                          ProviderF!.Image[index],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    initialPage: 0,
                    autoPlayCurve: Curves.easeInOutCubic,
                    autoPlayInterval: Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      print(index);
                      ProviderT!.changeindex(index);
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ProviderT!.Image
                      .asMap()
                      .entries
                      .map(
                        (e) => Container(
                          height: 5,
                          width: 5,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: e.key == ProviderT!.CurrentImageIndex
                                ? Color(0xff1565C0)
                                : Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
