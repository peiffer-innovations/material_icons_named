import 'package:flutter/widgets.dart';

@immutable
class ExampleIcon implements Comparable {
  const ExampleIcon(
    this.iconData,
    this.title,
  );

  final IconData iconData;
  final String title;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleIcon &&
          runtimeType == other.runtimeType &&
          iconData == other.iconData &&
          title == other.title;

  @override
  int get hashCode => iconData.hashCode ^ title.hashCode;

  @override
  int compareTo(other) => title.compareTo(other.title);

  @override
  String toString() => 'IconDefinition{iconData: $iconData, title: $title}';
}
