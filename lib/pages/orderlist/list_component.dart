part of 'view.dart';

class OrderListComponent extends StatefulWidget {
  final int status;
  final OrderListStore store;

  const OrderListComponent({
    Key key,
    this.status,
    @required this.store,
  })  : assert(store != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _OrderListState();
}

class _OrderListState extends State<OrderListComponent> {
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    print('length : ${widget.store.orderList.length}');
    return Observer(
      builder: (_) => RefreshComponent(
        controller: _controller,
        itemCount: widget.store.orderList.length,
        itemBuilder: (context, index) => OrderItemComponent(
            status: widget.status, entity: widget.store.orderList[index]),
        onRefresh: () => onRefresh(context, widget.store, _controller),
        onLoad: () => onLoad(context, widget.store, _controller),
        emptyWidget: EmptyView(
          () => onRefresh(context, widget.store, _controller),
        ),
      ),
    );
  }
}
