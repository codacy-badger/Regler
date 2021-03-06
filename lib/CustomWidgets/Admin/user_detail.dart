import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/functions.dart';
import 'package:flutter_app/Classes/strings.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';
import 'package:flutter_app/CustomWidgets/Common/expantion_tile.dart';

class UserDetailTile extends StatefulWidget {
  final ManageFunctions functions;
  final UserData user;
  UserDetailTile(this.user, this.functions);

  @override
  _UserDetailTileState createState() => _UserDetailTileState();
}

class _UserDetailTileState extends State<UserDetailTile> {
  @override
  Widget build(BuildContext context) {
    String strblock;

    if (widget.user.isBlcked) {
      strblock = Strings.unblock;
    } else {
      strblock = Strings.block;
    }

    if (widget.user.role == Strings.roleUser) {
      return InkWell(
          onTap: () {},
          child: Card(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  child: AppExpansionTile(
                    title: Row(
                      children: <Widget>[
                        CircularImage(
                          NetworkImage(widget.user.url),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(widget.user.name),
                        ),
                        //Text(name),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.user.institute,
                          style: TextStyle(color: Colors.tealAccent),
                        )
                      ],
                    ),
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  Strings.limit,
                                ),
                                Text(widget.user.limit.toString() + " M")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  Strings.usage,
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  widget.user.used.toString() + Strings.m,
                                  style: TextStyle(color: Colors.redAccent),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    Strings.bal,
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                  Text(
                                    widget.user.bal.toString() + Strings.m,
                                    style: TextStyle(color: Colors.tealAccent),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Tooltip(
                              message: Strings.changeLimit,
                              child: RawMaterialButton(
                                onPressed: () {
                                  widget.functions.change(widget.user);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.timeline,
                                        size: 15.0,
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(Strings.lblChlimit),
                                    ],
                                  ),
                                ),
                                fillColor: Colors.blue,
                                splashColor: Colors.blueAccent,
                                shape: const StadiumBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RawMaterialButton(
                              onPressed: () {
                                widget.functions.block(widget.user);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.block,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 2.0,
                                    ),
                                    Text(strblock),
                                  ],
                                ),
                              ),
                              fillColor: Colors.orange,
                              splashColor: Colors.orangeAccent,
                              shape: const StadiumBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RawMaterialButton(
                              onPressed: () {
                                widget.functions.delete(widget.user);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete,
                                      size: 15.0,
                                    ),
                                    SizedBox(
                                      width: 2.0,
                                    ),
                                    Text(Strings.delete),
                                  ],
                                ),
                              ),
                              fillColor: Colors.red,
                              splashColor: Colors.redAccent,
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))));
    } else {
      return Container();
    }
  }
}
