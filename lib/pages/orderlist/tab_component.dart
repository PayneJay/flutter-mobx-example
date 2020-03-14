part of 'view.dart';

class OrderTabComponent extends StatefulWidget {
  final OrderListStore store;

  const OrderTabComponent({
    Key key,
    @required this.store,
  })  : assert(store != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTabComponent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _initialIndex;

  @override
  void initState() {
    super.initState();
    _initialIndex = 0;
    _tabController = TabController(
        initialIndex: _initialIndex, length: choices.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        onTabChanged(widget.store, _tabController.index);
      }
    });
    onTabChanged(widget.store, _initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.themeGradientColor,
          ),
        ),
        centerTitle: true,
        title: GestureDetector(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  '公寓名称' * 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          ),
          onTap: () => switchHouse(context, widget.store),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              onPressed: () => filter(context, widget.store)),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () => search(context, widget.store)),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          unselectedLabelColor: Colors.white54,
          unselectedLabelStyle: TextStyle(fontSize: 13.0),
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 13.0),
          indicatorColor: Colors.transparent,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: choices.map((Choice choice) {
            return Tab(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(choice.title),
                  ),
                  Text(choice.count == 0
                      ? ''
                      : choice.count > 99 ? '99+' : '${choice.count}'),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices
            .map(
              (Choice choice) => OrderListComponent(
                store: widget.store,
                status: choice.status,
              ),
            )
            .toList(),
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
