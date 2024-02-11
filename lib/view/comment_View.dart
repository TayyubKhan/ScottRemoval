// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scotremovals/repository/comment_repo.dart';
import 'package:scotremovals/utils/utilis.dart';
import 'package:scotremovals/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/Components/Rounded_Button.dart';
import '../res/colors.dart';
import '../utils/Routes/routes_name.dart';
import '../view_model/dataViewModel.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  CommentRepo commentRepo = CommentRepo();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    final dataa = Provider.of<DataViewViewModel>(context, listen: false);
    if (dataa.cmt[dataa.index] != '') {
      _controller = TextEditingController(text: dataa.cmt[dataa.index]);
    }
    }
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataViewViewModel>(context, listen: true);
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.08,
          backgroundColor: BC.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.singleOrder);
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _controller,
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
                      borderSide: const BorderSide(color: BC.blue),
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
                            if (_controller.text.isNotEmpty) {
                              value.setLoading(true);
                              dynamic valid = await commentRepo.CommentAPI(
                                      context,
                                      sp.get('orderId').toString(),
                                      sp.get('user_id').toString(),
                                      sp.getString('driver').toString(),
                                      _controller.text.toString());
                              value.setLoading(false);
                              if (valid == true) {
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.singleOrder);
                              }
                            } else {
                              Utilis.error_flushbar_message(
                                  context, 'Kindly Comment Us');
                              value.setLoading(false);
                            }
                          });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
