import 'package:bank_ui_design/sqlite/user_model.dart';
import 'package:flutter/material.dart';
import '../consts/user_details_const.dart';
import '../custom_class/drawer_custom.dart';

class TransactionProgress extends StatefulWidget {
  final User user;
  const TransactionProgress({Key? key, required this.user}) : super(key: key);

  @override
  State<TransactionProgress> createState() => _TransactionProgressState();
}

class _TransactionProgressState extends State<TransactionProgress> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showComplete = true;
  int currentPage = 1;

  int itemsPerPage = 7;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey,
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [primaryColor, const  Color(0xff0f4c82)],//3577b8, Color(0xff2b659e)
              ),
              //color: primaryColor,
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 0,
                  ),
                  const Text(
                    'TRANSACTION',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 89,
                  ),
                  //const Icon(Icons.settings, color: Colors.white)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showComplete = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                            ),
                          ],
                          color: showComplete ? accentColor : Colors.grey,
                        ),
                        child: const Text(
                          'COMPLETE',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            showComplete = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey,
                              ),
                            ],
                            color: showComplete ? Colors.grey : accentColor,
                          ),
                          child: const Text(
                            'IN PROGRESS',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ))
                  ],
                ),
              )
            ])),
        if (showComplete)
          SizedBox(
              height: 500,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                shrinkWrap: true,
                itemCount: itemsPerPage,
                itemExtent: 66,
                itemBuilder: (BuildContext context, int index) {
                  final realIndex = (currentPage - 1) * itemsPerPage + index;
                  if (realIndex < transactions.length) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            avatarColors[realIndex % avatarColors.length],
                      ),
                      title: Text(transactions[realIndex].title),
                      subtitle: Text(transactions[realIndex].subTitle),
                      trailing: Text(transactions[realIndex].amount),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ))
        else
           SizedBox(
             height: 580,
             child: ListView.builder(
               padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              shrinkWrap: true,
              itemCount: transactions.length ,
              itemExtent: 61,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 21,
                    backgroundColor: colors[index],
                  ),
                  title: Text(transactions[index].title),
                  subtitle: Text(transactions[index].subTitle),
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Text(transactions[index].amount),
                  ),
                );
              },
          ),
           ),
        if (showComplete)
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (currentPage > 1) {
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                for (int i = 1;
                    i <= (transactions.length / itemsPerPage).ceil();
                    i++)
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        currentPage = i;
                      });
                    },
                    child: CircleAvatar(
                      key: const Key('current_page_key'),
                      radius: 15,
                      backgroundColor:
                          i == currentPage ? accentColor : Colors.grey,
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          color: i == currentPage ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    if (currentPage <
                        (transactions.length / itemsPerPage).ceil()) {
                      setState(() {
                        currentPage++;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        // else
        //   const Text(' '),
      ])),
      drawer: DrawerCustom(user: widget.user),
    );
  }
}
