import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/view_model/user_view_model.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: GestureDetector(
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => FavoriteItem(),
              //   ));
              // },
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/profile_photo_placeholder.png'),
              ),
            ),
            accountName: Text('Muhammad Nadeem'),
            accountEmail: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: [
                Row(
                  children: const [
                    Image(
                      image: AssetImage('assets/myorder.png'),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'My Order',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/go.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Go Unavailable',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/call.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Call Office',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/comment.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/history.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'History',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/send.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Send feedback',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/set.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Set Availability',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/performence.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Preferences',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  // onTap: () {
                  //   Navigator.of(context)
                  //       .push(MaterialPageRoute(builder: (context) => viewcart()));
                  // },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/about.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'About',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    user.remove();
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/logout.png'),
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
