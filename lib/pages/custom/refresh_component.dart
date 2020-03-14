import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mobx_example/helpers/AppColors.dart';

import 'classical_header.dart';
import 'classical_footer.dart';

class RefreshComponent extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final OnRefreshCallback onRefresh;
  final OnLoadCallback onLoad;
  final EasyRefreshController controller;
  final Widget emptyWidget;

  const RefreshComponent({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.onRefresh,
    @required this.onLoad,
    this.controller,
    this.emptyWidget,
  })  : assert(itemBuilder != null),
        assert(onRefresh != null),
        assert(onLoad != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _RefreshState();
}

class _RefreshState extends State<RefreshComponent>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      controller: widget.controller,
      header: QHHClassicalHeader(
        refreshText: '下拉刷新',
        refreshReadyText: '释放刷新',
        refreshingText: '正在刷新...',
        refreshedText: '刷新完成',
        refreshFailedText: '刷新失败',
        noMoreText: '客官，这回真没啦！',
        bgColor: Colors.transparent,
        textColor: AppColors.color666666,
        showInfo: false,
        refreshColor: AppColors.color58BC62,
        showRefreshIcon: true,
      ),
      footer: QHHClassicalFooter(
        loadedText: '加载完成',
        loadReadyText: '释放加载',
        loadingText: '正在加载...',
        loadFailedText: '加载失败',
        noMoreText: '客官，这回真没啦！😆😆😆',
        bgColor: Colors.transparent,
        textColor: AppColors.color666666,
        showInfo: false,
        loadColor: AppColors.color58BC62,
        showNoMoreIcon: false,
      ),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
      onRefresh: widget.onRefresh,
      onLoad: widget.onLoad,
      firstRefresh: true,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      emptyWidget: (widget.itemCount <= 0) ? widget.emptyWidget : null,
    );
  }

  ///保活状态
  @override
  bool get wantKeepAlive => true;
}
