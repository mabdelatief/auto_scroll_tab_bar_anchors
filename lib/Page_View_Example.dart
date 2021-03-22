import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> with TickerProviderStateMixin {
  PageController pageController;
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0,);
    pageController.addListener(() {

      _tabController.animateTo(pageController.page.toInt());
    });
    _tabController = new TabController(length: 4, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    Container(
    color: Colors.black,
      child: TabBar(
        onTap: (val) {
          pageController.animateToPage(val, duration: Duration(milliseconds: 100), curve: Curves.elasticInOut);
        },
        unselectedLabelColor: Colors.grey.shade700,
        indicatorColor:Colors.red,
        indicatorWeight: 2.0,
        labelColor: Colors.red,
        controller: _tabController,
        tabs: [  new Tab(
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
          ),],
        indicatorSize: TabBarIndicatorSize.tab,

      ),),
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            allowImplicitScrolling: false,
            pageSnapping: false,
            physics: RangeMaintainingScrollPhysics(),
            controller: pageController,
            // key: sliverListtKey,
            children: [
              Container(

            color: Colors.green,
    height: 100,
    ),
    Container(

    color: Colors.blue,
    height: 700,
    ),
    Container(

    color: Colors.orange,
    height: 500,
    ),
    Container(

    color: Colors.yellow,
    height: 900,
    )],),)

      ],
    );
  }
}


