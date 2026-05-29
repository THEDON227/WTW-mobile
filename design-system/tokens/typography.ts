export const fontFamilies = {
  serifDisplay: 'PlayfairDisplay-Bold',
  serifDisplayItalic: 'PlayfairDisplay-Italic',
  serifRegular: 'PlayfairDisplay-Regular',
  sans: 'System',
  sansBold: 'System',
} as const;

export const fontSizes = {
  xs: 10,
  sm: 12,
  base: 14,
  md: 16,
  lg: 18,
  xl: 22,
  '2xl': 28,
  '3xl': 34,
  '4xl': 42,
  '5xl': 52,
  display: 64,
} as const;

export const lineHeights = {
  tight: 1.1,
  snug: 1.25,
  normal: 1.4,
  relaxed: 1.6,
  loose: 2.0,
} as const;

export const letterSpacings = {
  tightest: -1.5,
  tight: -0.5,
  normal: 0,
  wide: 1.5,
  wider: 3,
  widest: 6,
  ultraWide: 10,
} as const;

export const fontWeights = {
  light: '300' as const,
  regular: '400' as const,
  medium: '500' as const,
  semibold: '600' as const,
  bold: '700' as const,
  extrabold: '800' as const,
  black: '900' as const,
};
