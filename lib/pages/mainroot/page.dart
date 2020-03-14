import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'package:flutter_mobx_example/helpers/AppColors.dart';
import 'package:flutter_mobx_example/helpers/iconfont.dart';

import 'package:flutter_mobx_example/pages/workbench/workbench.dart';
import 'package:flutter_mobx_example/pages/housestate/housestate.dart';
import 'package:flutter_mobx_example/pages/message/message.dart';
import 'package:flutter_mobx_example/pages/more/more.dart';

class MainRootPage extends StatefulWidget {
  @override
  _MainRootPageState createState() => _MainRootPageState();
}

class _MainRootPageState extends State<MainRootPage> {
  // 计数,点击次返回键退出程序
  int _lastClickTime = 0;

  List<Widget> _pages;

  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 首屏的四个页面
    _pages = <Widget>[
      WorkBenchPage(),
      HouseStatePage(),
      MessagePage(),
      MorePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: _pages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Color(AppColors.themeColor),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(IconFont.gongzuotai),
              activeIcon: Icon(IconFont.gongzuotai1),
              title: Text("工作台")),
          BottomNavigationBarItem(
              icon: Icon(IconFont.qiantai),
              activeIcon: Icon(IconFont.qiantai_shixin),
              title: Text("房态")),
          BottomNavigationBarItem(
              icon: Icon(IconFont.xiaoxi),
              activeIcon: Icon(IconFont.xiaoxi_shixin),
              title: Text("消息")),
          BottomNavigationBarItem(
              icon: Icon(IconFont.gengduo),
              activeIcon: Icon(IconFont.gengduo),
              title: Text("更多")),
        ],
        activeColor: Color(AppColors.tabItemSelectColor),
        inactiveColor: Color(AppColors.tabItemNormalColor),
        iconSize: 25,
        currentIndex: _tabIndex,
        onTap: (int index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}

// class MainrootPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return OKToast(
//       child: DefaultTabController(
//         length: 4,
//         initialIndex: 0,
//         child: Scaffold(
//           body: TabBarView(
//             children: <Widget>[
//               WorkBenchPage(),
//               HousestatePage(),
//               MessagePage(),
//               MorePage()
//             ]
//           ),
//           bottomNavigationBar: TabBar(
//             indicatorColor: Colors.transparent,
//             unselectedLabelColor: Color(0xFF999999),
//             labelColor: Color(0xFF58BC64),
//             labelStyle: TextStyle(
//               fontSize: 11,
//               fontWeight: FontWeight.w500
//             ),
//             tabs: <Widget>[
//               Tab(
//                 text: '工作台',
//                 icon: Icon(Icons.work),
//               ),
//               Tab(
//                 text: '房态',
//                 icon: Icon(Icons.room_service)
//               ),
//               Tab(
//                 text: '消息',
//                 icon: Icon(Icons.message),
//               ),
//               Tab(
//                 text: '更多',
//                 icon: Icon(Icons.more)
//               )
//             ],
//           ),
//         )
//       ),
//     );
//   }

// }
