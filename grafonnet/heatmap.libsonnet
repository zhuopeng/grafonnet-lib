{
  new(
    title,
    links=[],
    targets=[],
    datasource=null,
    cardPadding=null,
    cardRound=null,
    cardColor="#b4ff00",
    colorScale="sqrt",
    colorScheme="interpolateOranges",
    colorMode="spectrum",
    dataFormat="timeseries",
    heatmap={},
    highlightCards=true,
    showLegend=false,
    timeFrom=null,
    timeShift=null,
    tooltipShow=true,
    tooltipShowHistogram=false,
    tooltipDecimals=null,
    xAxisShow=true,
    xBucketNumber=null,
    xBucketSize=null,
    yAxisDecimals=null,
    yAxisFormat="none",
    yAxisLogBase=1,
    yAxisMax=null,
    yAxisMin=null,
    yAxisShow=true,
    yAxisSplitFactor=null,
    yBucketBound="auto",
    yBucketNumber=null,
    yBucketSize=null

  )::
  {
  "cards": {
    "cardPadding": cardPadding,
    "cardRound": cardRound
  },
  "color": {
  "cardColor": cardColor,
  "colorScale": colorScale,
  "colorScheme": colorScheme,
  // hard code it to 0.5, because of https://github.com/google/jsonnet/issues/558
  "exponent": 0.5,
  "mode": colorMode
  },
  "dataFormat": dataFormat,
  "datasource": datasource,
  "heatmap": heatmap,
  "highlightCards": highlightCards,

  "legend": {
  "show": showLegend
  },
  "links": links,
  "targets": targets,
  "timeFrom": timeFrom,
  "timeShift": timeShift,
  "title": title,
  "tooltip": {
  "show": tooltipShow,
  "showHistogram": tooltipShowHistogram
  },
  [if tooltipDecimals != null then "tooltipDecimals"]: tooltipDecimals,
  "type": "heatmap",
  "xAxis": {
  "show": xAxisShow
  },
  "xBucketNumber": xBucketNumber,
  "xBucketSize": xBucketSize,
  "yAxis": {
    "decimals": yAxisDecimals,
    "format": yAxisFormat,
    "logBase": yAxisLogBase,
    "max": yAxisMax,
    "min": yAxisMin,
    "show": yAxisShow,
    "splitFactor": yAxisSplitFactor
  },
  "yBucketBound": yBucketBound,
  "yBucketNumber": yBucketNumber,
  "yBucketSize": yBucketSize,
  _nextTarget:: 0,
  addTarget(target):: self {
    local nextTarget = super._nextTarget,
    _nextTarget: nextTarget + 1,
    targets+: [target { refId: std.char(std.codepoint('A') + nextTarget) }],
  },
  }
}
