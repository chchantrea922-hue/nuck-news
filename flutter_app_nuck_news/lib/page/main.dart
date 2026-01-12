import 'package:flutter/material.dart';
import 'contactP.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: const Color(0xFFEFEFEF),
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
                  fit: BoxFit.contain,
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
      body: Column(
        children: [
          //  FIXED HEADER
          Container(
            color: const Color(0xFFEFEFEF),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.video_library, color: Colors.white),
                      iconSize: 20,
                      onPressed: () {},
                    ),
                  ),
                ),
                const Spacer(),
                _customButton(
                  text: "Hot news 🔥",
                  color: const Color.fromARGB(255, 50, 143, 53),
                ),
                const SizedBox(width: 5),
                _customButton(
                  text: "News categories ▼",
                  color: const Color.fromARGB(255, 235, 158, 43),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),

          //  SCROLLABLE CONTENT
          Expanded(
  child: SingleChildScrollView(
    padding: const EdgeInsets.only(bottom: 120), // ✅ Reserve footer
    child: Column(
      children: [
        const Text(
          "Welcome!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _newsCard(
          image: 'assets/images/nucknews_logo.png',
          title: "Signing Ceremony",
          desc:
              "The signing ceremony of the Memorandum of Understanding (MoA)...",
        ),
        _videoCard(
          image: 'assets/images/nucknews_logo.png',
          title: "Education and Training Center",
        ),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Campus",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
        _campusRow(),
      ],
    ),
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
            IconButton(
              icon: const Icon(Icons.contact_phone,
                  color: Color(0xFFE69B31), size: 35),
              // កូដសម្រាប់បើកទៅ Contact Page
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
               
              },
              
            ),

            // ប៊ូតុង Home
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                color: Color(0xFFF7D9A0),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.home,
                      color: Color(0xFF2E6B2E), size: 40),
                  onPressed: () {},
                ),
              ),
            ),

            // ប៊ូតុង Location
            IconButton(
              icon: const Icon(Icons.location_on,
                  color: Color(0xFFE69B31), size: 35),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets (ដាក់នៅក្នុង Class HomePage) ---
  Widget _customButton({required String text, required Color color}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      onPressed: () {},
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _newsCard(
      {required String image, required String title, required String desc}) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(image,
                height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(desc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoCard({required String image, required String title}) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image,
                height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          const Icon(Icons.play_circle_fill, size: 60, color: Colors.black87),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _campusRow() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _campusItem('assets/images/nucknews_logo.png', "Kamchaymear"),
          _campusItem('assets/images/nucknews_logo.png', "Kampong Cham"),
          _campusItem('assets/images/nucknews_logo.png', "Prey Veng"),
        ],
      ),
    );
  }

  Widget _campusItem(String image, String title) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Image.asset(image, height: 80, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CONTACT PAGE (Class) =================
// class ContactPage extends StatelessWidget {
//   const ContactPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Contact Us"),
//         backgroundColor: const Color.fromARGB(255, 240, 178, 85),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Icon(Icons.contact_phone, size: 100, color: Colors.orange),
//             SizedBox(height: 20),
//             Text(
//               "ទំនាក់ទំនងមកកាន់ពួកយើង",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text("លេខទូរស័ព្ទ: 012 345 678"),
//             Text("អ៊ីមែល: nuck-news@example.com"),
//           ],
//         ),
//       ),
//     );
//   }
// }
