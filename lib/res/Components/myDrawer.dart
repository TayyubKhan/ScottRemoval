import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/res/Components/Call_and_Message.dart';
import 'package:scotremovals/res/Components/Drawer_comp.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String image = '';
  String name = '';
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  Future<void> _getdata() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      image = sp.getString('photo').toString();
      name = sp.get('name').toString();
      email = sp.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    Calland_message cm = Calland_message();
    final user = Provider.of<UserViewModel>(context);

    return Drawer(
      backgroundColor: BC.login,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: BC.login),
            currentAccountPicture: GestureDetector(
              // onTap: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => FavoriteItem(),
              //   ));
              // },
              child: CircleAvatar(
                child:
                    Image.network(image, errorBuilder: (context, error, stack) {
                  return Icon(Icons.error);
                }),
              ),
            ),
            accountName: Text(
              name,
            ),
            accountEmail: Text(email),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: [
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/go.png'),
                    color: Colors.white,
                  ),
                  title: 'My Order',
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.home);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/call.png'),
                    color: Colors.white,
                  ),
                  title: 'Call Office',
                  onPressed: () {
                    cm.makePhoneCall('07472212321');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/comment.png'),
                    color: Colors.white,
                  ),
                  title: 'Message',
                  onPressed: () {
                    cm.makeMessage('07472212321');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/history.png'),
                    color: Colors.white,
                  ),
                  title: 'History',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/send.png'),
                    color: Colors.white,
                  ),
                  title: 'Send feedback',
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.comment);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/set.png'),
                    color: Colors.white,
                  ),
                  title: 'Set Availability',
                  onPressed: () {
                    Utilis.submitted_flushbar_message(
                        context, 'Accessibility Changed');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/performence.png'),
                    color: Colors.white,
                  ),
                  title: 'Preferences',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/about.png'),
                    color: Colors.white,
                  ),
                  title: 'About',
                  onPressed: () {
                    cm.launchInBrowser(
                        context, Uri.parse('https://scotremovals.com/blog'));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Drawer_ROW(
                  icon: ImageIcon(
                    size: height * 0.04,
                    AssetImage('assets/logout.png'),
                    color: Colors.white,
                  ),
                  title: 'Log Out',
                  onPressed: () {
                    user.remove();
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                ),
                const SizedBox(
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
