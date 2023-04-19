import 'package:flutter/material.dart';
import 'package:pet_mind/login.dart';
import 'package:pet_mind/user_check.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [
          PageView(
            onPageChanged: (i) {
              setState(() {
                currentPageIndex = i;
              });
            },
            controller: _pageController,
            children: [
              Container(
                color: Colors.white,
                child: _page("assets/intro2.jpg", "Let's Find A Lovely Pet or A Friend!",
                    "now it's easier than ever to find a friend or a new replacement for the family"),
              ),
              Container(
                color: Color.fromARGB(255, 255, 208, 224),
                child: _page("assets/intro1.jpg", "Veterinarian Checks",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"),
              ),
              Container(
                color: Color.fromARGB(255, 255, 224, 206),
                child: _page("assets/intro3.jpg", "Pet Examine",
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip"),
              ),
              
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  onDotClicked: (index) {
                    _pageController.jumpToPage(index);
                  },
                ),
              )),
          if (currentPageIndex == 2)
            Align(
                alignment: Alignment.bottomCenter,
                
                child: Padding(
                  padding: const EdgeInsets.all(68),
                  

                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserCheck(),
                            ));
                      },
                      child: Text("Get Started")),
                ))
        ],
      ),
    );
  }

  Widget _page(String imagePath, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 230,
          ),
          SizedBox(
            height: 100,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal.shade800,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              )),
        ],
      ),
    );
  }
}