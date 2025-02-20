import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff824c75),
      surfaceTint: Color(0xff824c75),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd7f1),
      onPrimaryContainer: Color(0xff35082f),
      secondary: Color(0xff6f5767),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff9daed),
      onSecondaryContainer: Color(0xff281623),
      tertiary: Color(0xff815341),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdbce),
      onTertiaryContainer: Color(0xff321206),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff7f9),
      onBackground: Color(0xff201a1e),
      surface: Color(0xfffff7f9),
      onSurface: Color(0xff201a1e),
      surfaceVariant: Color(0xffefdee6),
      onSurfaceVariant: Color(0xff4f444a),
      outline: Color(0xff80737b),
      outlineVariant: Color(0xffd2c2ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e33),
      inverseOnSurface: Color(0xfffbedf3),
      inversePrimary: Color(0xfff5b2e1),
      primaryFixed: Color(0xffffd7f1),
      onPrimaryFixed: Color(0xff35082f),
      primaryFixedDim: Color(0xfff5b2e1),
      onPrimaryFixedVariant: Color(0xff68355c),
      secondaryFixed: Color(0xfff9daed),
      onSecondaryFixed: Color(0xff281623),
      secondaryFixedDim: Color(0xffdcbed0),
      onSecondaryFixedVariant: Color(0xff56404f),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff321206),
      tertiaryFixedDim: Color(0xfff5b9a3),
      onTertiaryFixedVariant: Color(0xff663c2c),
      surfaceDim: Color(0xffe4d7dc),
      surfaceBright: Color(0xfffff7f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f6),
      surfaceContainer: Color(0xfff8eaf0),
      surfaceContainerHigh: Color(0xfff2e5ea),
      surfaceContainerHighest: Color(0xffecdfe5),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff633158),
      surfaceTint: Color(0xff824c75),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9b628c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff523c4b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff866d7e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff613828),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9a6956),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff7f9),
      onBackground: Color(0xff201a1e),
      surface: Color(0xfffff7f9),
      onSurface: Color(0xff201a1e),
      surfaceVariant: Color(0xffefdee6),
      onSurfaceVariant: Color(0xff4b4046),
      outline: Color(0xff685c63),
      outlineVariant: Color(0xff84777e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e33),
      inverseOnSurface: Color(0xfffbedf3),
      inversePrimary: Color(0xfff5b2e1),
      primaryFixed: Color(0xff9b628c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff804a73),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff866d7e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c5565),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff9a6956),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7e513f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe4d7dc),
      surfaceBright: Color(0xfffff7f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f6),
      surfaceContainer: Color(0xfff8eaf0),
      surfaceContainerHigh: Color(0xfff2e5ea),
      surfaceContainerHighest: Color(0xffecdfe5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff3d0f36),
      surfaceTint: Color(0xff824c75),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff633158),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2f1c2a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff523c4b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3a190b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff613828),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff7f9),
      onBackground: Color(0xff201a1e),
      surface: Color(0xfffff7f9),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xffefdee6),
      onSurfaceVariant: Color(0xff2a2127),
      outline: Color(0xff4b4046),
      outlineVariant: Color(0xff4b4046),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e33),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe5f4),
      primaryFixed: Color(0xff633158),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4a1b41),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff523c4b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3a2734),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff613828),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff472314),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe4d7dc),
      surfaceBright: Color(0xfffff7f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f6),
      surfaceContainer: Color(0xfff8eaf0),
      surfaceContainerHigh: Color(0xfff2e5ea),
      surfaceContainerHighest: Color(0xffecdfe5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5b2e1),
      surfaceTint: Color(0xfff5b2e1),
      onPrimary: Color(0xff4e1e45),
      primaryContainer: Color(0xff68355c),
      onPrimaryContainer: Color(0xffffd7f1),
      secondary: Color(0xffdcbed0),
      onSecondary: Color(0xff3e2a38),
      secondaryContainer: Color(0xff56404f),
      onSecondaryContainer: Color(0xfff9daed),
      tertiary: Color(0xfff5b9a3),
      onTertiary: Color(0xff4b2618),
      tertiaryContainer: Color(0xff663c2c),
      onTertiaryContainer: Color(0xffffdbce),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff181216),
      onBackground: Color(0xffecdfe5),
      surface: Color(0xff181216),
      onSurface: Color(0xffecdfe5),
      surfaceVariant: Color(0xff4f444a),
      onSurfaceVariant: Color(0xffd2c2ca),
      outline: Color(0xff9b8d94),
      outlineVariant: Color(0xff4f444a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe5),
      inverseOnSurface: Color(0xff362e33),
      inversePrimary: Color(0xff824c75),
      primaryFixed: Color(0xffffd7f1),
      onPrimaryFixed: Color(0xff35082f),
      primaryFixedDim: Color(0xfff5b2e1),
      onPrimaryFixedVariant: Color(0xff68355c),
      secondaryFixed: Color(0xfff9daed),
      onSecondaryFixed: Color(0xff281623),
      secondaryFixedDim: Color(0xffdcbed0),
      onSecondaryFixedVariant: Color(0xff56404f),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff321206),
      tertiaryFixedDim: Color(0xfff5b9a3),
      onTertiaryFixedVariant: Color(0xff663c2c),
      surfaceDim: Color(0xff181216),
      surfaceBright: Color(0xff3f373c),
      surfaceContainerLowest: Color(0xff120c10),
      surfaceContainerLow: Color(0xff201a1e),
      surfaceContainer: Color(0xff241e22),
      surfaceContainerHigh: Color(0xff2f282c),
      surfaceContainerHighest: Color(0xff3a3337),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff9b6e6),
      surfaceTint: Color(0xfff5b2e1),
      onPrimary: Color(0xff2f0329),
      primaryContainer: Color(0xffba7daa),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0c2d5),
      onSecondary: Color(0xff22111d),
      secondaryContainer: Color(0xffa4899a),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffabda7),
      onTertiary: Color(0xff2b0d03),
      tertiaryContainer: Color(0xffba8470),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff181216),
      onBackground: Color(0xffecdfe5),
      surface: Color(0xff181216),
      onSurface: Color(0xfffff9f9),
      surfaceVariant: Color(0xff4f444a),
      onSurfaceVariant: Color(0xffd6c6cf),
      outline: Color(0xffad9fa7),
      outlineVariant: Color(0xff8d7f87),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe5),
      inverseOnSurface: Color(0xff2f282c),
      inversePrimary: Color(0xff69365e),
      primaryFixed: Color(0xffffd7f1),
      onPrimaryFixed: Color(0xff280023),
      primaryFixedDim: Color(0xfff5b2e1),
      onPrimaryFixedVariant: Color(0xff55244b),
      secondaryFixed: Color(0xfff9daed),
      onSecondaryFixed: Color(0xff1c0b18),
      secondaryFixedDim: Color(0xffdcbed0),
      onSecondaryFixedVariant: Color(0xff44303e),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff250801),
      tertiaryFixedDim: Color(0xfff5b9a3),
      onTertiaryFixedVariant: Color(0xff522c1d),
      surfaceDim: Color(0xff181216),
      surfaceBright: Color(0xff3f373c),
      surfaceContainerLowest: Color(0xff120c10),
      surfaceContainerLow: Color(0xff201a1e),
      surfaceContainer: Color(0xff241e22),
      surfaceContainerHigh: Color(0xff2f282c),
      surfaceContainerHighest: Color(0xff3a3337),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f9),
      surfaceTint: Color(0xfff5b2e1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff9b6e6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe0c2d5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfffabda7),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff181216),
      onBackground: Color(0xffecdfe5),
      surface: Color(0xff181216),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff4f444a),
      onSurfaceVariant: Color(0xfffff9f9),
      outline: Color(0xffd6c6cf),
      outlineVariant: Color(0xffd6c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe5),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff46183e),
      primaryFixed: Color(0xffffdef2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff9b6e6),
      onPrimaryFixedVariant: Color(0xff2f0329),
      secondaryFixed: Color(0xfffddef1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe0c2d5),
      onSecondaryFixedVariant: Color(0xff22111d),
      tertiaryFixed: Color(0xffffe0d6),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfffabda7),
      onTertiaryFixedVariant: Color(0xff2b0d03),
      surfaceDim: Color(0xff181216),
      surfaceBright: Color(0xff3f373c),
      surfaceContainerLowest: Color(0xff120c10),
      surfaceContainerLow: Color(0xff201a1e),
      surfaceContainer: Color(0xff241e22),
      surfaceContainerHigh: Color(0xff2f282c),
      surfaceContainerHighest: Color(0xff3a3337),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
