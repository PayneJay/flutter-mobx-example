enum FilterType {
  ///状态
  status,

  ///渠道
  channel,

  ///开始时间
  startTime,

  ///结束时间
  endTime,
}

const FilterTypeValues = {
  FilterType.status: 0,
  FilterType.channel: 1,
  FilterType.startTime: 2,
  FilterType.endTime: 3,
};
