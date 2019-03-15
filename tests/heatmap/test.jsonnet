local grafana = import 'grafonnet/grafana.libsonnet';
local heatmap = grafana.heatmap;

{
  "advanced": heatmap.new(
    "advanced",
    datasource="$COOL_DATASOURCE",
    cardColor="#b4ff11",
    colorScale="linear",
    colorScheme="interpolateBuGn",
    colorMode="opacity",
    dataFormat="tsbuckets",
    highlightCards=false,
    showLegend=true,
    tooltipShow=false,
    xAxisShow=false,
    yAxisShow=false
  ),
  "basic": heatmap.new("basic"),
  "with_buckets_options": heatmap.new(
    'with_buckets_options',
    xBucketNumber=10,
    xBucketSize="10s",
    yBucketNumber=10,
    yBucketSize=2,
    ),
  "with_bucket_time_series": heatmap.new(
    'with_bucket_time_series',
    dataFormat='tsbuckets',
    yAxisShow=true,
    yAxisFormat='accMS2',
    yBucketBound='upper'
  ),
  "with_opacity_mode": heatmap.new(
    'with_opacity_mode',
    colorMode='opacity',
    cardColor='#F2495C',
    colorScale='linear',
  ),
  "with_spectrum_mode": heatmap.new(
    'with_spectrum_mode',
    colorMode='spectrum',
    colorScheme='interpolateOranges'
  ),
  "with_targets": heatmap.new(
    'with_targets',
    targets=[{"a":1}, {"b":2}]
  ),
  "with_time_series": heatmap.new(
    'with_time_series',
    dataFormat='timeseries',
    yAxisShow=true,
    yAxisFormat='none',
    yAxisMin=0,
    yAxisMax=1000,
    yAxisDecimals=12
  ),
  "with_tooltip_options": heatmap.new(
    'with_tooltip_options',
    tooltipShow=true,
    tooltipShowHistogram=true,
    tooltipDecimals=12
  )
}
