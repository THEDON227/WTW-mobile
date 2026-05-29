export const palette = {
  // Neutrals
  black: '#000000',
  white: '#FFFFFF',
  trueBlack: '#050505',

  // Warm blacks
  warmBlack: '#0a0700',
  coolBlack: '#060a0f',
  deepBlack: '#04060f',

  // Grays
  gray100: '#F5F5F5',
  gray200: '#E5E5E5',
  gray300: '#D4D4D4',
  gray400: '#A3A3A3',
  gray500: '#737373',
  gray600: '#525252',
  gray700: '#404040',
  gray800: '#262626',
  gray900: '#171717',

  // Surface overlays
  surface01: 'rgba(255,255,255,0.04)',
  surface02: 'rgba(255,255,255,0.08)',
  surface03: 'rgba(255,255,255,0.12)',
  surface04: 'rgba(255,255,255,0.20)',
  surfaceDark: 'rgba(0,0,0,0.60)',
  surfaceDarker: 'rgba(0,0,0,0.80)',

  // Gold
  gold100: '#FEF3C7',
  gold200: '#FDE68A',
  gold300: '#FCD34D',
  gold400: '#F59E0B',
  gold500: '#C9A84C',
  gold600: '#B7791F',
  gold700: '#92400E',

  // Accent palette (cross-city)
  magenta: '#E91E8C',
  cyan: '#00C2E0',
  crimson: '#C41E3A',
  burntGold: '#C8922A',
  skyBlue: '#0EA5E9',
  electricCyan: '#06B6D4',
  indigo: '#6366F1',
  emerald: '#059669',
  electricGold: '#F59E0B',
  electricBlue: '#3B82F6',
} as const;

export type PaletteColor = keyof typeof palette;
