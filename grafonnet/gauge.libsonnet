{
  new(
    title,
    description='',
    datasource=null,
    maxValue=100,
    minValue=0,
    showThresholdLabels=false,
    showThresholdMarkers=true,
    thresholds=[{"index": 0,"value": null,"color": "#7EB26D"}],
    valueMappings=[],
    valueDecimals=null,
    valuePrefix="",
    valueStat="avg",
    valueSuffix="",
    valueUnit="none",
    timeFrom=null,
    timeShift=null,
    targets=[]
  )::
  {
    [if datasource != null then 'datasource']: datasource,
    [if description != '' then 'description']: description,
    "links": [],
    "options": {
      "maxValue": maxValue,
      "minValue": minValue,
      "showThresholdLabels": showThresholdLabels,
      "showThresholdMarkers": showThresholdMarkers,
      "thresholds": thresholds,
      "valueMappings": valueMappings,
      "valueOptions": {
        "decimals": valueDecimals,
        "prefix": valuePrefix,
        "stat": valueStat,
        "suffix": valueSuffix,
        "unit": valueUnit
      }
    },
    "targets": targets,
    "timeFrom": timeFrom,
    "timeShift": timeShift,
    "title": title,
    "type": "gauge",
    _nextTarget:: 0,
    addTarget(target):: self {
      local nextTarget = super._nextTarget,
      _nextTarget: nextTarget + 1,
      targets+: [target { refId: std.char(std.codepoint('A') + nextTarget) }],
    },
    },
}
