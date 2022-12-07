import 'package:flutter/material.dart';

class AdaptiveWindowType {
  const AdaptiveWindowType._({
    required this.name,
    required this.relativeSize,
    required this.widthRangeValues,
    required this.heightLandscapeRangeValues,
    required this.heightPortraitRangeValues,
  });

  final String name;

  final int relativeSize;

  final RangeValues widthRangeValues;

  final RangeValues heightLandscapeRangeValues;

  final RangeValues heightPortraitRangeValues;

  static const AdaptiveWindowType xsmall = AdaptiveWindowType._(
    name: 'xsmall',
    relativeSize: 0,
    widthRangeValues: RangeValues(0, 599),
    heightLandscapeRangeValues: RangeValues(0, 359),
    heightPortraitRangeValues: RangeValues(0, 959),
  );

  static const AdaptiveWindowType small = AdaptiveWindowType._(
    name: 'small',
    relativeSize: 1,
    widthRangeValues: RangeValues(600, 1023),
    heightLandscapeRangeValues: RangeValues(360, 719),
    heightPortraitRangeValues: RangeValues(360, 1599),
  );

  static const AdaptiveWindowType medium = AdaptiveWindowType._(
    name: 'medium',
    relativeSize: 2,
    widthRangeValues: RangeValues(1024, 1439),
    heightLandscapeRangeValues: RangeValues(720, 959),
    heightPortraitRangeValues: RangeValues(720, 1919),
  );

  static const AdaptiveWindowType large = AdaptiveWindowType._(
    name: 'large',
    relativeSize: 3,
    widthRangeValues: RangeValues(1440, 1919),
    heightLandscapeRangeValues: RangeValues(960, 1279),
    heightPortraitRangeValues: RangeValues(1920, double.infinity),
  );

  static const AdaptiveWindowType xlarge = AdaptiveWindowType._(
    name: 'xlarge',
    relativeSize: 4,
    widthRangeValues: RangeValues(1920, double.infinity),
    heightLandscapeRangeValues: RangeValues(1280, double.infinity),
    heightPortraitRangeValues: RangeValues(1920, double.infinity),
  );

  bool operator <=(AdaptiveWindowType other) =>
      relativeSize <= other.relativeSize;

  bool operator <(AdaptiveWindowType other) =>
      relativeSize < other.relativeSize;

  bool operator >=(AdaptiveWindowType other) =>
      relativeSize >= other.relativeSize;

  bool operator >(AdaptiveWindowType other) =>
      relativeSize > other.relativeSize;
}

class BreakpointSystemEntry {
  const BreakpointSystemEntry({
    required this.range,
    this.portrait,
    this.landscape,
    required this.adaptiveWindowType,
    required this.columns,
    required this.margin,
    required this.gutter,
  });

  final RangeValues range;

  final String? portrait;

  final String? landscape;

  final AdaptiveWindowType adaptiveWindowType;

  final int columns;

  final double margin;

  final double gutter;
}

const List<BreakpointSystemEntry> breakpointSystem = [
  BreakpointSystemEntry(
    range: RangeValues(0, 359),
    portrait: 'small handset',
    adaptiveWindowType: AdaptiveWindowType.xsmall,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(360, 399),
    portrait: 'medium handset',
    adaptiveWindowType: AdaptiveWindowType.xsmall,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(400, 479),
    portrait: 'large handset',
    adaptiveWindowType: AdaptiveWindowType.xsmall,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(480, 599),
    portrait: 'large handset',
    landscape: 'small handset',
    adaptiveWindowType: AdaptiveWindowType.xsmall,
    columns: 4,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(600, 719),
    portrait: 'small tablet',
    landscape: 'medium handset',
    adaptiveWindowType: AdaptiveWindowType.small,
    columns: 8,
    margin: 16.0,
    gutter: 16.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(720, 839),
    portrait: 'large tablet',
    landscape: 'large handset',
    adaptiveWindowType: AdaptiveWindowType.small,
    columns: 8,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(840, 959),
    portrait: 'large tablet',
    landscape: 'large handset',
    adaptiveWindowType: AdaptiveWindowType.small,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(960, 1023),
    landscape: 'small tablet',
    adaptiveWindowType: AdaptiveWindowType.small,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1024, 1279),
    landscape: 'large tablet',
    adaptiveWindowType: AdaptiveWindowType.medium,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1280, 1439),
    landscape: 'large tablet',
    adaptiveWindowType: AdaptiveWindowType.medium,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1440, 1599),
    portrait: 'small handset',
    adaptiveWindowType: AdaptiveWindowType.large,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1600, 1919),
    portrait: 'small handset',
    adaptiveWindowType: AdaptiveWindowType.large,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
  BreakpointSystemEntry(
    range: RangeValues(1920, double.infinity),
    portrait: 'small handset',
    adaptiveWindowType: AdaptiveWindowType.xlarge,
    columns: 12,
    margin: 24.0,
    gutter: 24.0,
  ),
];

AdaptiveWindowType getWindowType(BuildContext context) {
  return getBreakpointEntry(context).adaptiveWindowType;
}

BreakpointSystemEntry getBreakpointEntry(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  for (BreakpointSystemEntry entry in breakpointSystem) {
    if (entry.range.start <= width && width < entry.range.end + 1) {
      return entry;
    }
  }
  throw AssertionError('Something unexpected happened');
}
