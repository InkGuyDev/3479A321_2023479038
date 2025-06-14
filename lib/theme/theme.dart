import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff666000),
      surfaceTint: Color(0xff666000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffff200),
      onPrimaryContainer: Color(0xff736d00),
      secondary: Color(0xff666006),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffebe380),
      onSecondaryContainer: Color(0xff6a650c),
      tertiary: Color(0xff4e6700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcffe4f),
      onTertiaryContainer: Color(0xff597400),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffffae5),
      onSurface: Color(0xff1d1c10),
      onSurfaceVariant: Color(0xff4a4731),
      outline: Color(0xff7b785f),
      outlineVariant: Color(0xffccc7aa),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323123),
      inversePrimary: Color(0xffd5ca00),
      primaryFixed: Color(0xfff3e700),
      onPrimaryFixed: Color(0xff1e1c00),
      primaryFixedDim: Color(0xffd5ca00),
      onPrimaryFixedVariant: Color(0xff4d4800),
      secondaryFixed: Color(0xffeee683),
      onSecondaryFixed: Color(0xff1e1c00),
      secondaryFixedDim: Color(0xffd1ca6a),
      onSecondaryFixedVariant: Color(0xff4d4800),
      tertiaryFixed: Color(0xffc5f345),
      onTertiaryFixed: Color(0xff151f00),
      tertiaryFixedDim: Color(0xffaad626),
      onTertiaryFixedVariant: Color(0xff3a4d00),
      surfaceDim: Color(0xffdfdac6),
      surfaceBright: Color(0xfffffae5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f4df),
      surfaceContainer: Color(0xfff3eed9),
      surfaceContainerHigh: Color(0xffede8d4),
      surfaceContainerHighest: Color(0xffe7e3ce),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b3700),
      surfaceTint: Color(0xff666000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff766f00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3b3700),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff756f18),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2c3b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5b7600),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffffae5),
      onSurface: Color(0xff121206),
      onSurfaceVariant: Color(0xff393722),
      outline: Color(0xff56533c),
      outlineVariant: Color(0xff716e55),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323123),
      inversePrimary: Color(0xffd5ca00),
      primaryFixed: Color(0xff766f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c5700),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff756f18),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5c5700),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5b7600),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff465c00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcbc7b3),
      surfaceBright: Color(0xfffffae5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f4df),
      surfaceContainer: Color(0xffede8d4),
      surfaceContainerHigh: Color(0xffe2ddc9),
      surfaceContainerHighest: Color(0xffd6d2be),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff302d00),
      surfaceTint: Color(0xff666000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4f4b00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff302d00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4f4b00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff243000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3c5000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffffae5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2f2d19),
      outlineVariant: Color(0xff4c4a34),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff323123),
      inversePrimary: Color(0xffd5ca00),
      primaryFixed: Color(0xff4f4b00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff373400),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4f4b00),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff373400),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3c5000),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff293800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbdb9a6),
      surfaceBright: Color(0xfffffae5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f1dc),
      surfaceContainer: Color(0xffe7e3ce),
      surfaceContainerHigh: Color(0xffd9d5c1),
      surfaceContainerHighest: Color(0xffcbc7b3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffd5ca00),
      onPrimary: Color(0xff353200),
      primaryContainer: Color(0xfff3e700),
      onPrimaryContainer: Color(0xff6c6600),
      secondary: Color(0xffd1ca6a),
      onSecondary: Color(0xff353200),
      secondaryContainer: Color(0xff615b00),
      onSecondaryContainer: Color(0xffdcd473),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff273500),
      tertiaryContainer: Color(0xffc5f345),
      onTertiaryContainer: Color(0xff546d00),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151408),
      onSurface: Color(0xffe7e3ce),
      onSurfaceVariant: Color(0xffccc7aa),
      outline: Color(0xff959177),
      outlineVariant: Color(0xff4a4731),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e3ce),
      inversePrimary: Color(0xff666000),
      primaryFixed: Color(0xfff3e700),
      onPrimaryFixed: Color(0xff1e1c00),
      primaryFixedDim: Color(0xffd5ca00),
      onPrimaryFixedVariant: Color(0xff4d4800),
      secondaryFixed: Color(0xffeee683),
      onSecondaryFixed: Color(0xff1e1c00),
      secondaryFixedDim: Color(0xffd1ca6a),
      onSecondaryFixedVariant: Color(0xff4d4800),
      tertiaryFixed: Color(0xffc5f345),
      onTertiaryFixed: Color(0xff151f00),
      tertiaryFixedDim: Color(0xffaad626),
      onTertiaryFixedVariant: Color(0xff3a4d00),
      surfaceDim: Color(0xff151408),
      surfaceBright: Color(0xff3b3a2b),
      surfaceContainerLowest: Color(0xff0f0f04),
      surfaceContainerLow: Color(0xff1d1c10),
      surfaceContainer: Color(0xff212013),
      surfaceContainerHigh: Color(0xff2c2a1d),
      surfaceContainerHighest: Color(0xff373527),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffd5ca00),
      onPrimary: Color(0xff353200),
      primaryContainer: Color(0xfff3e700),
      onPrimaryContainer: Color(0xff4e4a00),
      secondary: Color(0xffe8e07d),
      onSecondary: Color(0xff292700),
      secondaryContainer: Color(0xff9a933a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff273500),
      tertiaryContainer: Color(0xffc5f345),
      onTertiaryContainer: Color(0xff3b4e00),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151408),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe2ddbf),
      outline: Color(0xffb7b397),
      outlineVariant: Color(0xff959177),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e3ce),
      inversePrimary: Color(0xff4e4a00),
      primaryFixed: Color(0xfff3e700),
      onPrimaryFixed: Color(0xff131200),
      primaryFixedDim: Color(0xffd5ca00),
      onPrimaryFixedVariant: Color(0xff3b3700),
      secondaryFixed: Color(0xffeee683),
      onSecondaryFixed: Color(0xff131200),
      secondaryFixedDim: Color(0xffd1ca6a),
      onSecondaryFixedVariant: Color(0xff3b3700),
      tertiaryFixed: Color(0xffc5f345),
      onTertiaryFixed: Color(0xff0d1300),
      tertiaryFixedDim: Color(0xffaad626),
      onTertiaryFixedVariant: Color(0xff2c3b00),
      surfaceDim: Color(0xff151408),
      surfaceBright: Color(0xff474536),
      surfaceContainerLowest: Color(0xff080801),
      surfaceContainerLow: Color(0xff1f1e11),
      surfaceContainer: Color(0xff2a281b),
      surfaceContainerHigh: Color(0xff353325),
      surfaceContainerHighest: Color(0xff403e30),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffd5ca00),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff3e700),
      onPrimaryContainer: Color(0xff2e2b00),
      secondary: Color(0xfffcf38f),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcdc667),
      onSecondaryContainer: Color(0xff0d0c00),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc5f345),
      onTertiaryContainer: Color(0xff222e00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff151408),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff6f1d2),
      outlineVariant: Color(0xffc8c3a7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e3ce),
      inversePrimary: Color(0xff4e4a00),
      primaryFixed: Color(0xfff3e700),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd5ca00),
      onPrimaryFixedVariant: Color(0xff131200),
      secondaryFixed: Color(0xffeee683),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd1ca6a),
      onSecondaryFixedVariant: Color(0xff131200),
      tertiaryFixed: Color(0xffc5f345),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffaad626),
      onTertiaryFixedVariant: Color(0xff0d1300),
      surfaceDim: Color(0xff151408),
      surfaceBright: Color(0xff535041),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff212013),
      surfaceContainer: Color(0xff323123),
      surfaceContainerHigh: Color(0xff3e3c2d),
      surfaceContainerHighest: Color(0xff494738),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
