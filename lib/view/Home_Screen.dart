import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';

import '../constant/colors.dart';
import '../data/response/status.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';
import '../widgets/myDrawer.dart';

// ignore: camel_case_types
class Home_screen_View extends StatefulWidget {
  const Home_screen_View({Key? key}) : super(key: key);

  @override
  State<Home_screen_View> createState() => _Home_screen_ViewState();
}

class _Home_screen_ViewState extends State<Home_screen_View> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchOrderListApi(context);
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    final Userprefrences = Provider.of<UserViewModel>(context);
    return Scaffold(
      key: _scaffold,
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        leading: IconButton(
            onPressed: () {
              _scaffold.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu, size: 32)),
        title: const Text(
          'My Orders',
          style: TextStyle(
              fontSize: 24, fontFamily: "HelveticaBold", color: BC.white),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            color: BC.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (BuildContext context, value, _) {
            switch (value.Order_List.status!) {
              case Status.LOADING:
                return const CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.Order_List.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: value.Order_List.data!.orderCount,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            Navigator.pushNamed(
                                context, RoutesName.singleOrder);
                          },
                          child: SizedBox(
                            width: width,
                            height: 90,
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? BC.green
                                          : BC.white,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width: width * 0.96,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '#12345',
                                              style: TextStyle(
                                                fontFamily: "HelveticaRegular",
                                                color: BC.lightGrey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                  color: BC.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: const Center(
                                                child: Text(
                                                  'Picked',
                                                  style: TextStyle(
                                                      color: BC.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              '19 Kingshill Avenue, Glasgow, Lanarkshire, G68 9NF, United Kingdom',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: "HelveticaBold",
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'Home Removals (est. 15.12 m3, 2 men)',
                                          style: TextStyle(
                                            fontFamily: "HelveticaRegular",
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        )
                      ],
                    );
                  }),
                );
            }
          },
        ),
      ),
    );
  }
}

// return Scaffold(
//     backgroundColor: const Color(0xff263238),
//     appBar: AppBar(
//       backgroundColor: primarycolor,
//       automaticallyImplyLeading: false,
//       centerTitle: true,
//       title: const Text(
//         "Movies List",
//         style: TextStyle(color: textcolor),
//       ),
//       actions: [
//         InkWell(
//           onTap: () {
//             Userprefrences.remove();
//           },
//           child: const Center(child: Text("Logout")),
//         )
//       ],
//     ),
//     body: SafeArea(
//       child: ChangeNotifierProvider<HomeViewViewModel>(
//         create: (BuildContext context) => homeViewViewModel,
//         child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
//           switch (value.moviesList.status!) {
//             case Status.LOADING:
//               return const CircularProgressIndicator();
//             case Status.ERROR:
//               return Text(value.moviesList.message.toString());
//             case Status.COMPLETED:
//               return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: value.moviesList.data!.movies!.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(22),
//                       child: Container(
//                         width: width,
//                         height: height,
//                         child: Column(
//                           children: [
//                             Image.network(
//                                 fit: BoxFit.contain,
//                                 width: 500,
//                                 height: 350,
//                                 value.moviesList.data!.movies![index]
//                                     .posterurl!
//                                     .toString(),
//                                 errorBuilder: (context, error, stack) {
//                               return const Icon(
//                                 size: 100,
//                                 Icons.error,
//                                 color: Colors.red,
//                               );
//                             }),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Text(
//                                 value.moviesList.data!.movies![index].title!
//                                     .toString(),
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30,
//                                     color: textcolor)),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row_Component(
//                                 string1: "Genre:    ",
//                                 string2: value
//                                     .moviesList.data!.movies![index].genres!
//                                     .toString()),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row_Component(
//                                 string1: "Actors:   ",
//                                 string2: value
//                                     .moviesList.data!.movies![index].actors!
//                                     .toString()),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row_Component(
//                                 string1: "Release Date:   ",
//                                 string2: value.moviesList.data!
//                                     .movies![index].releaseDate!
//                                     .toString()),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 const Text("Story Line:  ",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: textcolor)),
//                                 Flexible(
//                                     child: Text(
//                                   value.moviesList.data!.movies![index]
//                                       .storyline!
//                                       .toString(),
//                                   style: const TextStyle(color: textcolor),
//                                 )),
//                                 SizedBox(
//                                   height: height * 0.01,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             Row(
//                               children: [
//                                 const Text('Rating:    ',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: textcolor)),
//                                 Text(
//                                     Utilis.averageRating(value.moviesList
//                                             .data!.movies![index].ratings!)
//                                         .toStringAsFixed(1),
//                                     style:
//                                         const TextStyle(color: textcolor)),
//                                 const Text("\\ 10",
//                                     style: TextStyle(color: textcolor)),
//                                 const Icon(
//                                   Icons.star_outlined,
//                                   color: Colors.yellow,
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//           }
//           return Container();
//         }),
//       ),
//     ));
