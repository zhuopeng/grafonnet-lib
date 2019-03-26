{
  new(
    title,
    colorMode="Panel",
    displayName="",
    clusterName="",
    colors={
      "crit": "rgba(245, 54, 54, 0.9)",
      "disable": "rgba(128, 128, 128, 0.9)",
      "ok": "rgba(50, 128, 45, 0.9)",
      "warn": "rgba(237, 129, 40, 0.9)"
    },
    cornerRadius=0,
    datasource=null,
    flipCard=false,
    flipTime=5,
    fontFormat="Regular",
    isAutoScrollOnOverflow=false,
    isGrayOnNoData=false,
    isHideAlertsOnDisable=false,
    isIgnoreOKColors=false,
    links=[],
    targets=[],
    timeFrom=null,
    timeShift=null
  )::
  {
  "clusterName": if clusterName != "" then clusterName else title,
  "colorMode": colorMode,
  "colors": colors,
  "cornerRadius": cornerRadius,
  "datasource": datasource,
  "displayName": if displayName != "" then displayName else title,
  "flipCard": flipCard,
  "flipTime": flipTime,
  "fontFormat": fontFormat,
  "isAutoScrollOnOverflow": isAutoScrollOnOverflow,
  "isGrayOnNoData": isGrayOnNoData,
  "isHideAlertsOnDisable": isHideAlertsOnDisable,
  "isIgnoreOKColors": isIgnoreOKColors,
  "links": links,
  _nextTarget:: 0,
  addTarget(
    target,
    aggregation='Avg',
    alias=null,
    crit=null,
    warn=null,
    decimals=2,
    displayAliasType="Warning / Critical",
    displayType="Regular",
    displayValueWithAlias="When Alias Displayed",
    units="none",
    valueHandler="Number Threshold",
    legendFormat=null
  ):: self {
    local nextTarget = super._nextTarget,
    _nextTarget: nextTarget + 1,
    targets+: [target {
      refId: std.char(std.codepoint('A') + nextTarget),
      aggregation: aggregation,
      [if alias != null then "alias"]: alias,
      [if warn != null then "warn"]: warn,
      [if crit != null then "crit"]: crit,
      decimals: decimals,
      displayAliasType: displayAliasType,
      displayType: displayType,
      displayValueWithAlias: displayValueWithAlias,
      units: units,
      valueHandler: valueHandler,
      [if legendFormat != null then "legendFormat"]: legendFormat
    }],
  },
  "timeFrom": timeFrom,
  "timeShift": timeShift,
  "title": title,
  "type": "vonage-status-panel"
  }
}
