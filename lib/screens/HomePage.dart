import 'package:flutter/material.dart';
import 'package:instawish/components/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(top: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < 25; i++)
                Column(
                  children: [
                    UserAvatar(filename: "avatar2.jpg", border: true),
                    Text("User $i")
                  ],
                ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Stack(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 50),
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 15,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Container(
                    margin: EdgeInsets.only(left: 20), child: Text("Username")),
              ),
              Icon(Icons.more_vert, size: 30, color: Colors.grey),
            ],
          ),
          Positioned(
            child: Transform.translate(
                offset: Offset(-5, -10),
                child: UserAvatar(filename: "avatar2.jpg", border: true)),
          ),
        ]),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              "https://images.unsplash.com/photo-1526666923127-b2970f64b422",
              width: 380,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return child;
          }, loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
          }),
        ),
        // Description de la photo
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10),
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 15,
                offset: Offset(0.0, 0.75),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description de la photo", style: TextStyle(fontSize: 16)),
              Text("Voir les 2 commentaires",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ),
        SizedBox(
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.only(top: 10),
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 15,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Badge(
                      backgroundColor: Colors.grey,
                      label: Text("2"),
                      child: Icon(Icons.chat_bubble_outline,
                          size: 30, color: Colors.black54),
                    ),
                    // Like button with rounded border and shadow effect and décaler en haut
                    Transform.translate(
                      offset: Offset(0, -10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 15,
                              offset: Offset(0.0, 0.75),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 2,
                          ),
                        ),
                        child: Badge(
                          backgroundColor: Colors.red,
                          label: Text("18"),
                          child: Icon(Icons.favorite_border,
                              size: 30, color: Colors.black54),
                        ),
                      ),
                    ),
                    Icon(Icons.send, size: 30, color: Colors.black54),
                  ],
                ),
              ),
              Icon(Icons.bookmark_border, size: 30, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}
