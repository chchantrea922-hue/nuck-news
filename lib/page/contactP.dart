import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';


void main() {
  runApp(const MaterialApp(
    home: ContactPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBody: true,
      // ================= APP BAR =================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          automaticallyImplyLeading: false, // ❌ លុប Back button
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          titleSpacing: 20,
          title: const Text(
            "NUCK-NEWS",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Transform.scale(
                scale: 1.4,
                child: Image.asset(
                  'assets/images/nucknews_logo.png',
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 240, 178, 85),
                  Color.fromARGB(255, 248, 245, 241),
                ],
              ),
            ),
          ),
        ),
      ),
      
      // ================= BODY (BACKGROUND + CONTENT) =================
      body: Stack(
       children: [
    Positioned.fill(
      child: Image.asset(
        'assets/images/IMG_7412.JPG',
        fit: BoxFit.cover,
      ),
    ),

    // 🔹 Opacity Overlay
    Positioned.fill(
      child: Container(
        color: const Color.fromARGB(255, 251, 250, 250).withOpacity(0.4),
      ),
    ),
Positioned(
  top: 30,
  left: 20,
  right: 20,
  child: ImageSlider(),
),


    Positioned.fill(
      child: Image.asset(
        'assets/images/IMG_7412.JPG',
        fit: BoxFit.cover,
      ),
    ),
 // opacity Background Overlay
    Positioned.fill(
      child: Container(
        color: Colors.white.withOpacity(0.7),
      ),
    ),

    // 🔹 Image Slider
    Positioned(
      top: 30,
      left: 20,
      right: 20,
      child: const ImageSlider(),
    ),

    // 🔹 Contact Content
    Positioned(
      top: 310,
      left: 0,
      right: 0,
      child: Column(
        children: [
          const Text(
            "ទំនាក់ទំនងមកកាន់យើងខ្ញុំ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon('assets/images/nucknews_logo.png'),
              _socialIcon('assets/images/nucknews_logo.png'),
              _socialIcon('assets/images/nucknews_logo.png'),
              _socialIcon('assets/images/nucknews_logo.png'),
            ],
          ),
        ],
      ),
    ),
  ],
),


       // ================= CUSTOM FOOTER  =================
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(60, 0, 60, 30),
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFF9EBD3),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ប៊ូតុង Contacts
           
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 217, 160),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.contact_phone,
                      color: Color(0xFF2E6B2E), size: 40),
                  onPressed: () {
                   },
                ),
              ),
            ),

            // ប៊ូតុង Home
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 247, 217, 160),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.home,
                      color: Color(0xFFE69B31), size: 40),
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
                  },
                ),
              ),
            ),

            // ប៊ូតុង Location
            IconButton(
              icon: const Icon(Icons.location_on,
                  color: Color(0xFFE69B31), size: 35),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
  

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}


//Image Slider State

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  late PageController _pageController;
  Timer? _timer;

  final List<String> images = [
    'assets/images/IMG_7412.JPG',
    'assets/images/IMG_7412.JPG',
    'assets/images/IMG_7412.JPG',
  ];
  @override
void initState() {
  super.initState();
  _pageController = PageController();

  _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
    if (_currentIndex < images.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }

    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  });
}
@override
void dispose() {
  _timer?.cancel();
  _pageController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(

        height: 250,
        child: Stack(
          children: [
            // 🔹 PageView (Images)
          PageView.builder(
  controller: _pageController,
  itemCount: images.length,
  onPageChanged: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  itemBuilder: (context, index) {
    return Image.asset(
      images[index],
      fit: BoxFit.cover,
      width: double.infinity,
    );
  },
),

            // 🔹 Dots Indicator ON IMAGE
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 8 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// ================= SOCIAL ICON =================
Widget _socialIcon(String assetPath) {
  return Container(
    margin: const EdgeInsets.only(top: 10), // 🔽 ចុះក្រោម
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Image.asset(
      assetPath,
      width: 40,
      height: 40,
    ),
  );
}


