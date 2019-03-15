local grafana = import 'grafonnet/grafana.libsonnet';
local gauge = grafana.gauge;

{
  advanced: gauge.new(
    'advanced test',
    description="test",
    datasource='$PROMETHEUS',
    maxValue=10,
    minValue=0,
    showThresholdLabels=true,
    showThresholdMarkers=false,
    thresholds=[{"color": "#7EB16D","index": 0,"value": null}],
    valueMappings=[],
    valueDecimals=":",
    valuePrefix="",
    valueStat='avg',
    valueSuffix="",
    valueUnit='percentunit',
    timeFrom=null,
    timeShift=null
  ),
  basic: gauge.new('test'),
  with_gauge_options: gauge.new(
    'gauge option test',
    minValue=42,
    maxValue=420,
    showThresholdLabels=true,
    showThresholdMarkers=true
    ),
  with_targets: gauge.new(
    'test',
    targets=[{"a":1}, {"b":2}]
  ),
  with_thresholds: gauge.new(
    'test thresholds',
    thresholds=[
      {
        "index": 0,
        "value": null,
        "color": "#7EB26D"
      },
      {
        "color": "#6ED0E0",
        "index": 1,
        "value": 50
      },
      {
        "color": "#EF843C",
        "index": 2,
        "value": 75
      },
      {
        "color": "#E24D42",
        "index": 3,
        "value": 87.5
      }
    ]
  ),
  with_value_options: gauge.new(
    'value options tests',
    valueStat='min',
    valueUnit='accFS2',
    valueDecimals='##',
    valuePrefix="testPrefix",
    valueSuffix="testSuffix"
  )

}
