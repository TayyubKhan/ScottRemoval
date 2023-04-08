import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/comment_repo.dart';
import 'package:scotremovals/utils/Routes/routes_name.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';

class Comment_View extends StatefulWidget {
  @override
  State<Comment_View> createState() => _Comment_ViewState();
}

CommentRepo commentRepo = CommentRepo();
TextEditingController _controller = TextEditingController();

class _Comment_ViewState extends State<Comment_View> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: BC.blue,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: BC.white,
            )),
        title: Text(
          'Add Comment',
          style: TextStyle(
            color: BC.white,
            fontSize: width * 0.067,
            fontFamily: "HelveticaBold",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              maxLines: 10,
              style: TextStyle(
                color: Colors.black,
                fontSize: width * 0.048,
                fontFamily: "HelveticaRegular",
              ),
              decoration: InputDecoration(
                  hintText: 'Add Comment.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            const Spacer(),
            Center(
              child: Semantics(
                button: true,
                child: Consumer<AuthViewModelProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Rounded_Button2(
                        width: width * 0.9,
                        height: height * 1,
                        title: "DONE",
                        loading: value.loading,
                        onPress: () async {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();

                          if (_controller.toString().isNotEmpty) {
                            if (commentRepo.CommentAPI(
                                    context,
                                    sp.get('id').toString(),
                                    '593',
                                    sp.getString('driver').toString(),
                                    _controller.toString()) ==
                                true) {
                              value
                                  .setLoading(value.setLoading(!value.loading));
                              Navigator.pushNamed(
                                  context, RoutesName.singleOrder);
                            }
                          } else {
                            Utilis.error_flushbar_message(
                                context, 'Kindly Comment Us');
                          }

                          ;
                        });
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
