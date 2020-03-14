part of 'view.dart';

class TimeTabWidget extends StatefulWidget {
  final FilterOrderStore store;

  const TimeTabWidget({
    Key key,
    @required this.store,
  })  : assert(store != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTabWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    widget.store.setTimeType(tabs[0].id);
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.store.setTimeType(tabs[_tabController.index].id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TabBar(
          controller: _tabController,
          labelColor: AppColors.color333333,
          unselectedLabelColor: AppColors.color80333333,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(style: BorderStyle.none),
          ),
          labelStyle: TextStyle(fontSize: 15),
          tabs: tabs.map((tab) => Tab(text: tab.name)).toList(),
        ),
      ),
      body: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(1, 1), blurRadius: 15),
            BoxShadow(
              color: Colors.white,
            ),
          ],
        ),
        child: TabBarView(
            controller: _tabController,
            children: tabs.map(
              (tab) {
                return ListView(
                  children: ListTile.divideTiles(context: context, tiles: [
                    buildItemView(context, widget.store, FilterType.startTime),
                    buildItemView(context, widget.store, FilterType.endTime),
                  ]).toList(),
                );
              },
            ).toList()),
      ),
    );
  }

  @override
  void dispose() {
    //先调用controller.dispose释放了动画资源，再调用super
    _tabController.dispose();
    super.dispose();
  }
}

const List<TimeChoice> tabs = [
  const TimeChoice(id: 1, name: '预定时间'),
  const TimeChoice(id: 2, name: '入住时间'),
  const TimeChoice(id: 3, name: '离店时间'),
];

class TimeChoice {
  final int id;
  final String name;

  const TimeChoice({this.id, this.name});
}
