import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:zr/helpers/colors.dart';

class ChartData {
  static List<ChartLayer> weekly() {
    return [
      ChartAxisLayer(
        settings: const ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 13.0,
            min: 7.0,
            textStyle: TextStyle(
              color: CustomTheme.themeAccent,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 10.0,
            max: 100.0,
            min: 0.0,
            textStyle: TextStyle(
              color: CustomTheme.themeAccent,
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => [
          'Mon',
          'Tue',
          'Wed',
          'Thu',
          'Fri',
          'Sat',
          'Sun'
        ][value.toInt() - 7],
        labelY: (value) => value.toInt().toString(),
      ),
      ChartBarLayer(
        items: List.generate(
          7,
          (index) => ChartBarDataItem(
            color: CustomTheme.theme,
            value: Random().nextInt(80) + 20,
            x: index.toDouble() + 7,
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }

  static List<ChartLayer> monthly() {
    return [
      ChartAxisLayer(
        settings: const ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: 1.0,
            max: 23.0,
            min: 12.0,
            textStyle: TextStyle(
              color: CustomTheme.themeAccent,
              fontSize: 10.0,
            ),
          ),
          y: ChartAxisSettingsAxis(
            frequency: 10.0,
            max: 100.0,
            min: 0.0,
            textStyle: TextStyle(
              color: CustomTheme.themeAccent,
              fontSize: 10.0,
            ),
          ),
        ),
        labelX: (value) => [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sept',
          'Oct',
          'Nov',
          'Dec'
        ][value.toInt() - 12],
        labelY: (value) => value.toInt().toString(),
      ),
      ChartBarLayer(
        items: List.generate(
          12,
          (index) => ChartBarDataItem(
            color: CustomTheme.theme,
            value: Random().nextInt(80) + 20,
            x: index.toDouble() + 12,
          ),
        ),
        settings: const ChartBarSettings(
          thickness: 8.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }
}
