import 'package:flutter/material.dart';
import 'package:rommify_app/core/theming/colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? selectedIcon;
  List<bool> isExpandedList =
      List.generate(10, (index) => false); // Initialize list with false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                // Image and info row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/1O0A0210.jpg'),
                    ),
                    SizedBox(width: 35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abanoub Maged",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Interior Designer",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          "@abanoub185",
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text("1.3k followers",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            SizedBox(width: 20),
                            Text("45 following",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Interactive icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildIcon(Icons.favorite, 'favorite', () {}),
                    SizedBox(width: 30),
                    _buildIcon(Icons.history, 'history', () {}),
                    SizedBox(width: 30),
                    _buildIcon(Icons.bookmark, 'bookmark', () {}),
                  ],
                ),
                SizedBox(height: 20),
                // Image Grid - Modified mainAxisSpacing to 0
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 15, // Changed from previous value to 0
                      childAspectRatio: 169 / 128, // Set the aspect ratio
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ImageCard(
                        imageUrl: 'assets/images/Group 25.png',
                        profileImageUrl: 'assets/images/1O0A0210.jpg',
                        onExpand: () {
                          setState(() {
                            isExpandedList[index] = !isExpandedList[index];
                          });
                        },
                        isExpanded: isExpandedList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Settings icon at the top
          Positioned(
            top: 25,
            right: 10,
            child: Icon(Icons.settings, color: Colors.white, size: 28),
          ),
        ],
      ),
    );
  }

  // Method to build icons that change color when tapped
  Widget _buildIcon(IconData icon, String key, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = key;
        });
        onTap.call();
      },
      child: Icon(
        icon,
        color: selectedIcon == key ? Colors.white : Colors.grey,
        size: 35,
      ),
    );
  }
}


class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String profileImageUrl;
  final VoidCallback onExpand;
  final bool isExpanded;

  const ImageCard({super.key, 
    required this.imageUrl,
    required this.profileImageUrl,
    required this.onExpand,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage(profileImageUrl),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onExpand,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isExpanded)
                 const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.bookmark_border,
                          color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Icon(Icons.favorite_border,
                          color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Icon(Icons.download, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                    ],
                  ),
                Container(
                 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, 
                    border: Border.all(
                      color: Colors.grey, 
                      width: 3, 
                    ),
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white, 
                    size: 24, 
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
