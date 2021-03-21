import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final greenKey = new GlobalKey();
  final blueKey = new GlobalKey();
  final orangeKey = new GlobalKey();
  final yellowKey = new GlobalKey();
  final sliverListtKey = new GlobalKey();
  RenderBox overRender;
  RenderBox revRender;
  RenderBox menuRender;
  RenderBox contactRender;
  RenderBox sliverRender;
  ScrollController scrollController;
  TabController _tabController;
  TabController _topTabController;
  TabController _menuTabController;
  double overHeight;
  double menuHeight;
  double contactHeight;
  double reviewsHeight;
  bool pinMenu = false;
  int menuIndex = 0;
  List<String> imgs = [
    "assets/rest1.jpg",
    "assets/rest10.jpg",
    "assets/rest11.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    _tabController = new TabController(length: 4, vsync: this);
    _menuTabController = new TabController(length: 4, vsync: this);
    _topTabController =
    new TabController(length: 4, vsync: this);
    // _topTabController.index =
    //     0;
    addScrollControllerListener();
  }

  void addScrollControllerListener(){
    scrollController.addListener(() {
      if (greenKey.currentContext != null) {
        overHeight = greenKey.currentContext.size.height;
      }
      if (blueKey.currentContext != null) {
        menuHeight = blueKey.currentContext.size.height;
      }
      if (orangeKey.currentContext != null) {
        contactHeight = orangeKey.currentContext.size.height;
      }
      if (yellowKey.currentContext != null) {
        reviewsHeight = yellowKey.currentContext.size.height;
      }
      if (scrollController.offset > overHeight + 200 &&
          scrollController.offset < menuHeight + overHeight + 200) {
        if (pinMenu == false) {
          setState(() {
            pinMenu = true;
          });
        }
      } else {
        if (pinMenu) {
          setState(() {
            pinMenu = false;
          });
        }
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (scrollController.offset > 0 &&
            scrollController.offset < overHeight + 200) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > overHeight + 200 &&
            scrollController.offset < menuHeight + overHeight + 200) {
          _tabController.animateTo(1);
        } else if (scrollController.offset > menuHeight + overHeight + 200 &&
            scrollController.offset <
                menuHeight + overHeight + contactHeight + 200) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
            menuHeight + overHeight + contactHeight + 200 &&
            scrollController.offset <=
                menuHeight + overHeight + contactHeight + reviewsHeight + 200) {
          _tabController.animateTo(3);
        } else {}
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (scrollController.offset < overHeight) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > overHeight &&
            scrollController.offset < menuHeight + overHeight) {
          _tabController.animateTo(1);
        } else if (scrollController.offset > menuHeight + overHeight &&
            scrollController.offset < menuHeight + overHeight + contactHeight) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
            menuHeight + overHeight + contactHeight &&
            scrollController.offset <
                menuHeight + overHeight + contactHeight + reviewsHeight) {
          _tabController.animateTo(3);
        } else {}
      }
    });
  }

  void tabBarOnTap(val) {
    switch (val) {
      case 0:
        {
          if (greenKey.currentContext == null) {
            scrollController.position
                .ensureVisible(
              orangeKey.currentContext.findRenderObject(),
              alignment:
              0.0, // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 200),
            )
                .then((value) {
              scrollController.position
                  .ensureVisible(
                orangeKey.currentContext.findRenderObject(),
                alignment:
                0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  blueKey.currentContext.findRenderObject(),
                  alignment:
                  0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    greenKey.currentContext.findRenderObject(),
                    alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            });
          } else {
            scrollController.position.ensureVisible(
              greenKey.currentContext.findRenderObject(),
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
      case 1:
        {
          if (blueKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                greenKey.currentContext.findRenderObject(),
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  greenKey.currentContext.findRenderObject(),
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    blueKey.currentContext.findRenderObject(),
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                orangeKey.currentContext.findRenderObject(),
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  orangeKey.currentContext.findRenderObject(),
                  alignment: 0.0,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    blueKey.currentContext.findRenderObject(),
                    alignment: 0.5,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position.ensureVisible(
                      blueKey.currentContext.findRenderObject(),
                      alignment: 0.0,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    );
                  });
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              blueKey.currentContext.findRenderObject(),
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 400),
            );
          }
        }
        break;
      case 2:
        {
          if (orangeKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                greenKey.currentContext.findRenderObject(),
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  greenKey.currentContext.findRenderObject(),
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    blueKey.currentContext.findRenderObject(),
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      blueKey.currentContext.findRenderObject(),
                      alignment: 0.5,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position.ensureVisible(
                        orangeKey.currentContext.findRenderObject(),
                        alignment: 0.2,
                        // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      );
                    });
                  });
                });
              });
            } else if (_tabController.previousIndex == 1) {
              scrollController.position
                  .ensureVisible(
                blueKey.currentContext.findRenderObject(),
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position.ensureVisible(
                  orangeKey.currentContext.findRenderObject(),
                  alignment: 0.2,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                );
              });
            }
          } else {
            scrollController.position.ensureVisible(
              orangeKey.currentContext.findRenderObject(),
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 600),
            );
          }
        }
        break;
      case 3:
        {
          if (yellowKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                greenKey.currentContext.findRenderObject(),
                alignment:
                0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  greenKey.currentContext.findRenderObject(),
                  alignment:
                  0.5, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    blueKey.currentContext.findRenderObject(),
                    alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      blueKey.currentContext.findRenderObject(),
                      alignment:
                      0.5, // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position
                          .ensureVisible(
                        orangeKey.currentContext.findRenderObject(),
                        alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      )
                          .then((value) {
                        scrollController.position
                            .ensureVisible(
                          orangeKey.currentContext
                              .findRenderObject(),
                          alignment:
                          0.5, // How far into view the item should be scrolled (between 0 and 1).
                          duration: const Duration(milliseconds: 200),
                        )
                            .then((value) {
                          scrollController.position.ensureVisible(
                            yellowKey.currentContext
                                .findRenderObject(),
                            alignment:
                            0.0, // How far into view the item should be scrolled (between 0 and 1).
                            duration:
                            const Duration(milliseconds: 200),
                          );
                        });
                      });
                    });
                  });
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                blueKey.currentContext.findRenderObject(),
                alignment:
                1.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  orangeKey.currentContext.findRenderObject(),
                  alignment:
                  0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    yellowKey.currentContext.findRenderObject(),
                    alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              yellowKey.currentContext.findRenderObject(),
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
    }
  }

  SliverPersistentHeader makeTabBarHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
          color: Colors.white,
          child: TabBar(
            onTap: (val) {
              tabBarOnTap(val);
            },
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor:Colors.red,
            indicatorWeight: 2.0,
            labelColor: Colors.red,
            controller: _tabController,
            tabs: <Widget>[
              new Tab(
                child: Text(
                  "Green",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Blue",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Orange",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              new Tab(
                child: Text(
                  "Yellow",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _topTabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    height: data.size.height / 5,
                  color: Colors.black,
                  ),
              ],
            ),
          ),
          makeTabBarHeader(),
          SliverList(
            key: sliverListtKey,
            delegate: SliverChildListDelegate(
              [
                Container(
                  key: greenKey,
                  color: Colors.green,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: blueKey,
                  color: Colors.blue,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: orangeKey,
                  color: Colors.orange,
                  height: data.size.height / 1.1,
                ),
                Container(
                  key: yellowKey,
                  color: Colors.yellow,
                  height: data.size.height / 1.1,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
