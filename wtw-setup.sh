#!/usr/bin/env bash
# WTW (Where's The Wave) — Session 1 Foundation Setup
# Run from the root of your WTW-mobile repo:
#   chmod +x wtw-setup.sh && ./wtw-setup.sh

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

echo "🌊 WTW Setup — creating foundation files..."

mkdir -p app/"(tabs)" store design-system/tokens design-system/themes

# ─────────────────────────────────────────────────────────────────────────────
# app.json
# ─────────────────────────────────────────────────────────────────────────────
cat > app.json << 'ENDOFFILE'
{
  "expo": {
    "name": "WTW",
    "slug": "wtw-mobile",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "dark",
    "scheme": "wtw",
    "ios": {
      "supportsTablet": true,
      "bundleIdentifier": "com.wtw.mobile"
    },
    "android": {
      "adaptiveIcon": {
        "backgroundColor": "#0a0700",
        "foregroundImage": "./assets/android-icon-foreground.png",
        "backgroundImage": "./assets/android-icon-background.png",
        "monochromeImage": "./assets/android-icon-monochrome.png"
      },
      "predictiveBackGestureEnabled": false,
      "package": "com.wtw.mobile"
    },
    "web": {
      "favicon": "./assets/favicon.png",
      "bundler": "metro"
    },
    "plugins": [
      "expo-router",
      "expo-status-bar",
      "expo-font",
      "expo-image"
    ],
    "experiments": {
      "typedRoutes": true
    }
  }
}
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# store/cityStore.ts
# ─────────────────────────────────────────────────────────────────────────────
cat > store/cityStore.ts << 'ENDOFFILE'
import { create } from 'zustand';
import type { CityCode } from '../design-system/themes';

export type Aura =
  | 'all'
  | 'vip'
  | 'rooftop'
  | 'live-music'
  | 'after-hours';

interface CityState {
  selectedCity: CityCode;
  selectedAura: Aura;
  setCity: (city: CityCode) => void;
  setAura: (aura: Aura) => void;
}

export const useCityStore = create<CityState>((set) => ({
  selectedCity: 'nyc',
  selectedAura: 'all',
  setCity: (city) => set({ selectedCity: city }),
  setAura: (aura) => set({ selectedAura: aura }),
}));
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# design-system/tokens/colors.ts
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/tokens/colors.ts << 'ENDOFFILE'
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
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# design-system/tokens/typography.ts
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/tokens/typography.ts << 'ENDOFFILE'
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
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# design-system/tokens/spacing.ts
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/tokens/spacing.ts << 'ENDOFFILE'
export const spacing = {
  0: 0,
  1: 4,
  2: 8,
  3: 12,
  4: 16,
  5: 20,
  6: 24,
  7: 28,
  8: 32,
  10: 40,
  12: 48,
  14: 56,
  16: 64,
  20: 80,
  24: 96,
  32: 128,
} as const;

export const borderRadius = {
  none: 0,
  sm: 4,
  md: 8,
  lg: 12,
  xl: 16,
  '2xl': 20,
  '3xl': 28,
  full: 9999,
} as const;

export const insets = {
  screenHorizontal: 20,
  screenTop: 16,
  cardPadding: 16,
  sectionGap: 32,
} as const;
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# design-system/themes/index.ts
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/themes/index.ts << 'ENDOFFILE'
export interface CityTheme {
  city: string;
  cityCode: string;
  background: string;
  primary: string;
  primaryMuted: string;
  primaryGlow: string;
  surface: string;
  surfaceElevated: string;
  text: {
    primary: string;
    secondary: string;
    tertiary: string;
    inverse: string;
    accent: string;
  };
  hero: {
    gradient: string[];
    overlayStart: string;
    overlayEnd: string;
  };
  tagline: string;
  vibeWords: string[];
  filterTabs: string[];
  waveColor: string;
  momentumColor: string;
}

export type CityCode = 'nyc' | 'miami' | 'la' | 'atl' | 'hou' | 'nj' | 'phl' | 'chi' | 'dc' | 'las';

export { nycTheme } from './nyc';
export { miamiTheme } from './miami';
export { laTheme } from './la';
export { atlantaTheme } from './atlanta';
export { houstonTheme } from './houston';
export { njTheme } from './nj';
export { phillyTheme } from './philly';
export { chicagoTheme } from './chicago';
export { dcTheme } from './dc';
export { lasVegasTheme } from './lasvegas';

import { nycTheme } from './nyc';
import { miamiTheme } from './miami';
import { laTheme } from './la';
import { atlantaTheme } from './atlanta';
import { houstonTheme } from './houston';
import { njTheme } from './nj';
import { phillyTheme } from './philly';
import { chicagoTheme } from './chicago';
import { dcTheme } from './dc';
import { lasVegasTheme } from './lasvegas';

export const cityThemes: Record<CityCode, CityTheme> = {
  nyc: nycTheme,
  miami: miamiTheme,
  la: laTheme,
  atl: atlantaTheme,
  hou: houstonTheme,
  nj: njTheme,
  phl: phillyTheme,
  chi: chicagoTheme,
  dc: dcTheme,
  las: lasVegasTheme,
};

export const cityList: { code: CityCode; name: string }[] = [
  { code: 'nyc', name: 'New York' },
  { code: 'miami', name: 'Miami' },
  { code: 'la', name: 'Los Angeles' },
  { code: 'atl', name: 'Atlanta' },
  { code: 'hou', name: 'Houston' },
  { code: 'nj', name: 'New Jersey' },
  { code: 'phl', name: 'Philadelphia' },
  { code: 'chi', name: 'Chicago' },
  { code: 'dc', name: 'Washington DC' },
  { code: 'las', name: 'Las Vegas' },
];
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# City theme files
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/themes/nyc.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const nycTheme: CityTheme = {
  city: 'New York',
  cityCode: 'nyc',
  background: '#0a0700',
  primary: '#C9A84C',
  primaryMuted: 'rgba(201,168,76,0.20)',
  primaryGlow: 'rgba(201,168,76,0.45)',
  surface: 'rgba(201,168,76,0.06)',
  surfaceElevated: 'rgba(201,168,76,0.11)',
  text: {
    primary: '#F5EDD6',
    secondary: 'rgba(245,237,214,0.65)',
    tertiary: 'rgba(245,237,214,0.35)',
    inverse: '#0a0700',
    accent: '#C9A84C',
  },
  hero: {
    gradient: ['#0a0700', '#1a1100', '#2a1d05'],
    overlayStart: 'rgba(10,7,0,0.00)',
    overlayEnd: 'rgba(10,7,0,0.92)',
  },
  tagline: 'Where every borough has a secret.',
  vibeWords: ['Upscale', 'Editorial', 'Late Night', 'Jazz', 'Rooftop'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#C9A84C',
  momentumColor: '#FDE68A',
};
ENDOFFILE

cat > design-system/themes/miami.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const miamiTheme: CityTheme = {
  city: 'Miami',
  cityCode: 'miami',
  background: '#0a0008',
  primary: '#E91E8C',
  primaryMuted: 'rgba(233,30,140,0.20)',
  primaryGlow: 'rgba(233,30,140,0.50)',
  surface: 'rgba(233,30,140,0.06)',
  surfaceElevated: 'rgba(233,30,140,0.12)',
  text: {
    primary: '#FDE8F3',
    secondary: 'rgba(253,232,243,0.65)',
    tertiary: 'rgba(253,232,243,0.35)',
    inverse: '#0a0008',
    accent: '#E91E8C',
  },
  hero: {
    gradient: ['#0a0008', '#1a0012', '#2d0020'],
    overlayStart: 'rgba(10,0,8,0.00)',
    overlayEnd: 'rgba(10,0,8,0.92)',
  },
  tagline: "The heat doesn't stop at midnight.",
  vibeWords: ['Poolside', 'Neon', 'Latin', 'Rooftop', 'Bottle Service'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#E91E8C',
  momentumColor: '#F9A8D4',
};
ENDOFFILE

cat > design-system/themes/la.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const laTheme: CityTheme = {
  city: 'Los Angeles',
  cityCode: 'la',
  background: '#060a0f',
  primary: '#00C2E0',
  primaryMuted: 'rgba(0,194,224,0.18)',
  primaryGlow: 'rgba(0,194,224,0.45)',
  surface: 'rgba(0,194,224,0.06)',
  surfaceElevated: 'rgba(0,194,224,0.11)',
  text: {
    primary: '#E0F7FA',
    secondary: 'rgba(224,247,250,0.65)',
    tertiary: 'rgba(224,247,250,0.35)',
    inverse: '#060a0f',
    accent: '#00C2E0',
  },
  hero: {
    gradient: ['#060a0f', '#081218', '#0a1a24'],
    overlayStart: 'rgba(6,10,15,0.00)',
    overlayEnd: 'rgba(6,10,15,0.92)',
  },
  tagline: 'Every hill hides a better party.',
  vibeWords: ['Industry', 'Rooftop', 'Sunset', 'Celebrity', 'Minimal'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#00C2E0',
  momentumColor: '#67E8F9',
};
ENDOFFILE

cat > design-system/themes/atlanta.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const atlantaTheme: CityTheme = {
  city: 'Atlanta',
  cityCode: 'atl',
  background: '#0a0000',
  primary: '#C41E3A',
  primaryMuted: 'rgba(196,30,58,0.20)',
  primaryGlow: 'rgba(196,30,58,0.48)',
  surface: 'rgba(196,30,58,0.07)',
  surfaceElevated: 'rgba(196,30,58,0.13)',
  text: {
    primary: '#FFE4E8',
    secondary: 'rgba(255,228,232,0.65)',
    tertiary: 'rgba(255,228,232,0.35)',
    inverse: '#0a0000',
    accent: '#C41E3A',
  },
  hero: {
    gradient: ['#0a0000', '#1a0004', '#280008'],
    overlayStart: 'rgba(10,0,0,0.00)',
    overlayEnd: 'rgba(10,0,0,0.92)',
  },
  tagline: "ATL doesn't sleep — it switches sets.",
  vibeWords: ['Trap', 'Lounge', 'Hip-Hop', 'Exclusive', 'Rooftop'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#C41E3A',
  momentumColor: '#FCA5A5',
};
ENDOFFILE

cat > design-system/themes/houston.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const houstonTheme: CityTheme = {
  city: 'Houston',
  cityCode: 'hou',
  background: '#080600',
  primary: '#C8922A',
  primaryMuted: 'rgba(200,146,42,0.20)',
  primaryGlow: 'rgba(200,146,42,0.45)',
  surface: 'rgba(200,146,42,0.06)',
  surfaceElevated: 'rgba(200,146,42,0.12)',
  text: {
    primary: '#FFF3DC',
    secondary: 'rgba(255,243,220,0.65)',
    tertiary: 'rgba(255,243,220,0.35)',
    inverse: '#080600',
    accent: '#C8922A',
  },
  hero: {
    gradient: ['#080600', '#160e00', '#221600'],
    overlayStart: 'rgba(8,6,0,0.00)',
    overlayEnd: 'rgba(8,6,0,0.92)',
  },
  tagline: "Space City doesn't need a reason to celebrate.",
  vibeWords: ['Southern', 'Luxury', 'Live Music', 'Patio', 'R&B'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#C8922A',
  momentumColor: '#FCD34D',
};
ENDOFFILE

cat > design-system/themes/nj.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const njTheme: CityTheme = {
  city: 'New Jersey',
  cityCode: 'nj',
  background: '#00060f',
  primary: '#0EA5E9',
  primaryMuted: 'rgba(14,165,233,0.18)',
  primaryGlow: 'rgba(14,165,233,0.45)',
  surface: 'rgba(14,165,233,0.06)',
  surfaceElevated: 'rgba(14,165,233,0.11)',
  text: {
    primary: '#E0F2FE',
    secondary: 'rgba(224,242,254,0.65)',
    tertiary: 'rgba(224,242,254,0.35)',
    inverse: '#00060f',
    accent: '#0EA5E9',
  },
  hero: {
    gradient: ['#00060f', '#000e1f', '#00152e'],
    overlayStart: 'rgba(0,6,15,0.00)',
    overlayEnd: 'rgba(0,6,15,0.92)',
  },
  tagline: 'Skyline views. No tourist tax.',
  vibeWords: ['Waterfront', 'Skyline', 'Late Night', 'Lounge', 'Upscale'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#0EA5E9',
  momentumColor: '#7DD3FC',
};
ENDOFFILE

cat > design-system/themes/philly.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const phillyTheme: CityTheme = {
  city: 'Philadelphia',
  cityCode: 'phl',
  background: '#00080a',
  primary: '#06B6D4',
  primaryMuted: 'rgba(6,182,212,0.18)',
  primaryGlow: 'rgba(6,182,212,0.45)',
  surface: 'rgba(6,182,212,0.06)',
  surfaceElevated: 'rgba(6,182,212,0.11)',
  text: {
    primary: '#CFFAFE',
    secondary: 'rgba(207,250,254,0.65)',
    tertiary: 'rgba(207,250,254,0.35)',
    inverse: '#00080a',
    accent: '#06B6D4',
  },
  hero: {
    gradient: ['#00080a', '#001418', '#001c22'],
    overlayStart: 'rgba(0,8,10,0.00)',
    overlayEnd: 'rgba(0,8,10,0.92)',
  },
  tagline: 'The city that invented the underground.',
  vibeWords: ['Raw', 'Authentic', 'Jazz', 'After Hours', 'Industrial'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#06B6D4',
  momentumColor: '#67E8F9',
};
ENDOFFILE

cat > design-system/themes/chicago.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const chicagoTheme: CityTheme = {
  city: 'Chicago',
  cityCode: 'chi',
  background: '#04060f',
  primary: '#6366F1',
  primaryMuted: 'rgba(99,102,241,0.20)',
  primaryGlow: 'rgba(99,102,241,0.48)',
  surface: 'rgba(99,102,241,0.07)',
  surfaceElevated: 'rgba(99,102,241,0.13)',
  text: {
    primary: '#EEF2FF',
    secondary: 'rgba(238,242,255,0.65)',
    tertiary: 'rgba(238,242,255,0.35)',
    inverse: '#04060f',
    accent: '#6366F1',
  },
  hero: {
    gradient: ['#04060f', '#07091c', '#0a0c28'],
    overlayStart: 'rgba(4,6,15,0.00)',
    overlayEnd: 'rgba(4,6,15,0.92)',
  },
  tagline: 'Chi-town hits different after midnight.',
  vibeWords: ['House', 'Deep', 'Architecture', 'Lakefront', 'Underground'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#6366F1',
  momentumColor: '#A5B4FC',
};
ENDOFFILE

cat > design-system/themes/dc.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const dcTheme: CityTheme = {
  city: 'Washington DC',
  cityCode: 'dc',
  background: '#00080a',
  primary: '#059669',
  primaryMuted: 'rgba(5,150,105,0.18)',
  primaryGlow: 'rgba(5,150,105,0.45)',
  surface: 'rgba(5,150,105,0.06)',
  surfaceElevated: 'rgba(5,150,105,0.11)',
  text: {
    primary: '#D1FAE5',
    secondary: 'rgba(209,250,229,0.65)',
    tertiary: 'rgba(209,250,229,0.35)',
    inverse: '#00080a',
    accent: '#059669',
  },
  hero: {
    gradient: ['#00080a', '#00120e', '#001c16'],
    overlayStart: 'rgba(0,8,10,0.00)',
    overlayEnd: 'rgba(0,8,10,0.92)',
  },
  tagline: 'Power moves happen after dark.',
  vibeWords: ['Political', 'Diplomatic', 'Jazz', 'Rooftop', 'Upscale'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#059669',
  momentumColor: '#6EE7B7',
};
ENDOFFILE

cat > design-system/themes/lasvegas.ts << 'ENDOFFILE'
import type { CityTheme } from './index';

export const lasVegasTheme: CityTheme = {
  city: 'Las Vegas',
  cityCode: 'las',
  background: '#080500',
  primary: '#F59E0B',
  primaryMuted: 'rgba(245,158,11,0.22)',
  primaryGlow: 'rgba(245,158,11,0.55)',
  surface: 'rgba(245,158,11,0.07)',
  surfaceElevated: 'rgba(245,158,11,0.13)',
  text: {
    primary: '#FFFBEB',
    secondary: 'rgba(255,251,235,0.65)',
    tertiary: 'rgba(255,251,235,0.35)',
    inverse: '#080500',
    accent: '#F59E0B',
  },
  hero: {
    gradient: ['#080500', '#160d00', '#221600'],
    overlayStart: 'rgba(8,5,0,0.00)',
    overlayEnd: 'rgba(8,5,0,0.92)',
  },
  tagline: 'The strip never runs out of signal.',
  vibeWords: ['Casino', 'Spectacle', 'EDM', 'Dayclub', 'Residency'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#F59E0B',
  momentumColor: '#FDE68A',
};
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# design-system/ThemeProvider.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > design-system/ThemeProvider.tsx << 'ENDOFFILE'
import React, { createContext, useContext } from 'react';
import { useCityStore } from '../store/cityStore';
import { cityThemes } from './themes';
import type { CityTheme } from './themes';

const ThemeContext = createContext<CityTheme>(cityThemes.nyc);

export function ThemeProvider({ children }: { children: React.ReactNode }) {
  const selectedCity = useCityStore((s) => s.selectedCity);
  const theme = cityThemes[selectedCity];

  return (
    <ThemeContext.Provider value={theme}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useTheme(): CityTheme {
  return useContext(ThemeContext);
}
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/_layout.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > app/_layout.tsx << 'ENDOFFILE'
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { ThemeProvider } from '../design-system/ThemeProvider';

export default function RootLayout() {
  return (
    <SafeAreaProvider>
      <ThemeProvider>
        <StatusBar style="light" />
        <Stack
          screenOptions={{
            headerShown: false,
            animation: 'fade',
            contentStyle: { backgroundColor: '#050505' },
          }}
        >
          <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
        </Stack>
      </ThemeProvider>
    </SafeAreaProvider>
  );
}
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/(tabs)/_layout.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > 'app/(tabs)/_layout.tsx' << 'ENDOFFILE'
import { Tabs } from 'expo-router';
import { useTheme } from '../../design-system/ThemeProvider';
import { Text, View, StyleSheet } from 'react-native';
import { letterSpacings, fontSizes, fontWeights } from '../../design-system/tokens/typography';

function TabIcon({ label, focused, color }: { label: string; focused: boolean; color: string }) {
  return (
    <View style={styles.tabItem}>
      <Text style={[
        styles.tabLabel,
        { color: focused ? color : 'rgba(255,255,255,0.35)' },
        focused && styles.tabLabelActive,
      ]}>
        {label}
      </Text>
      {focused && <View style={[styles.tabDot, { backgroundColor: color }]} />}
    </View>
  );
}

export default function TabsLayout() {
  const theme = useTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarStyle: {
          backgroundColor: theme.background,
          borderTopColor: theme.surface,
          borderTopWidth: 1,
          height: 72,
          paddingBottom: 12,
          paddingTop: 10,
        },
        tabBarShowLabel: false,
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="RADAR" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="explore"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="EXPLORE" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="saved"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="SAVED" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="profile"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="PROFILE" focused={focused} color={theme.primary} />
          ),
        }}
      />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  tabItem: {
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
    minWidth: 60,
  },
  tabLabel: {
    fontSize: fontSizes.xs,
    fontWeight: fontWeights.semibold,
    letterSpacing: letterSpacings.wider,
  },
  tabLabelActive: {
    fontWeight: fontWeights.bold,
  },
  tabDot: {
    width: 3,
    height: 3,
    borderRadius: 2,
    marginTop: 2,
  },
});
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/(tabs)/explore.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > 'app/(tabs)/explore.tsx' << 'ENDOFFILE'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function Explore() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.text, { color: theme.text.secondary }]}>EXPLORE</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  text: { fontSize: 12, letterSpacing: 6, fontWeight: '600' },
});
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/(tabs)/saved.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > 'app/(tabs)/saved.tsx' << 'ENDOFFILE'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function Saved() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.text, { color: theme.text.secondary }]}>SAVED</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  text: { fontSize: 12, letterSpacing: 6, fontWeight: '600' },
});
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/(tabs)/profile.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > 'app/(tabs)/profile.tsx' << 'ENDOFFILE'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function Profile() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.text, { color: theme.text.secondary }]}>PROFILE</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  text: { fontSize: 12, letterSpacing: 6, fontWeight: '600' },
});
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/radar.tsx
# ─────────────────────────────────────────────────────────────────────────────
cat > app/radar.tsx << 'ENDOFFILE'
// Alias — radar is served from the tabs index (bottom nav tab 1).
export { default } from './(tabs)/index';
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
# app/(tabs)/index.tsx  (flagship Radar screen)
# ─────────────────────────────────────────────────────────────────────────────
cat > 'app/(tabs)/index.tsx' << 'ENDOFFILE'
import React, { useState, useRef } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  Dimensions,
  Animated,
  Modal,
  FlatList,
} from 'react-native';
import { Image } from 'expo-image';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useTheme } from '../../design-system/ThemeProvider';
import { useCityStore } from '../../store/cityStore';
import { cityList, cityThemes } from '../../design-system/themes';
import { spacing, borderRadius, insets } from '../../design-system/tokens/spacing';
import { fontSizes, fontWeights, letterSpacings, lineHeights } from '../../design-system/tokens/typography';
import type { Aura } from '../../store/cityStore';

const { width: SCREEN_W, height: SCREEN_H } = Dimensions.get('window');

const FILTER_TABS: { label: string; aura: Aura }[] = [
  { label: 'ALL', aura: 'all' },
  { label: 'VIP TABLES', aura: 'vip' },
  { label: 'ROOFTOPS', aura: 'rooftop' },
  { label: 'LIVE MUSIC', aura: 'live-music' },
  { label: 'AFTER HOURS', aura: 'after-hours' },
];

interface Venue {
  id: string;
  name: string;
  image: string;
  matchPct: number;
  vibeTags: string[];
  hours: string;
  peakTime: string;
  priceTier: '$' | '$$' | '$$$' | '$$$$';
  saved: boolean;
}

const MOCK_VENUES: Venue[] = [
  {
    id: '1',
    name: 'Cipriani Club',
    image: 'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?w=800&auto=format',
    matchPct: 97,
    vibeTags: ['Upscale', 'Late Night'],
    hours: '9PM – 4AM',
    peakTime: '12AM',
    priceTier: '$$$$',
    saved: false,
  },
  {
    id: '2',
    name: 'The Monarch',
    image: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=800&auto=format',
    matchPct: 92,
    vibeTags: ['Rooftop', 'Cocktails'],
    hours: '8PM – 3AM',
    peakTime: '11PM',
    priceTier: '$$$',
    saved: true,
  },
  {
    id: '3',
    name: 'Studio 432',
    image: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&auto=format',
    matchPct: 88,
    vibeTags: ['Live Music', 'DJ'],
    hours: '10PM – 5AM',
    peakTime: '1AM',
    priceTier: '$$',
    saved: false,
  },
  {
    id: '4',
    name: 'Soho Terrace',
    image: 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=800&auto=format',
    matchPct: 84,
    vibeTags: ['After Hours', 'Minimal'],
    hours: '11PM – 6AM',
    peakTime: '2AM',
    priceTier: '$$$',
    saved: false,
  },
];

const HIGHLIGHT_IMAGES = [
  'https://images.unsplash.com/photo-1541532713592-79a0317b6b77?w=600&auto=format',
  'https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?w=600&auto=format',
  'https://images.unsplash.com/photo-1506157786151-b8491531f063?w=600&auto=format',
  'https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?w=600&auto=format',
];

function WaveBars({ color }: { color: string }) {
  const bars = [0.4, 0.7, 1.0, 0.6, 0.85, 0.5, 0.9, 0.65, 0.75, 0.45, 0.8, 0.55];
  return (
    <View style={waveStyles.container}>
      {bars.map((h, i) => (
        <View
          key={i}
          style={[
            waveStyles.bar,
            { height: 28 * h, backgroundColor: color, opacity: 0.6 + h * 0.4 },
          ]}
        />
      ))}
    </View>
  );
}

const waveStyles = StyleSheet.create({
  container: { flexDirection: 'row', alignItems: 'flex-end', gap: 3, height: 32 },
  bar: { width: 4, borderRadius: 2 },
});

function VenueCard({
  venue, primary, textPrimary, textSecondary, surface,
}: {
  venue: Venue; primary: string; textPrimary: string; textSecondary: string; surface: string;
}) {
  const [saved, setSaved] = useState(venue.saved);

  return (
    <View style={[cardStyles.card, { backgroundColor: surface, borderColor: `${primary}22` }]}>
      <View style={cardStyles.imageWrap}>
        <Image source={{ uri: venue.image }} style={cardStyles.image} contentFit="cover" transition={300} />
        <View style={[cardStyles.matchBadge, { backgroundColor: primary }]}>
          <Text style={cardStyles.matchText}>{venue.matchPct}%</Text>
        </View>
        <TouchableOpacity
          style={cardStyles.bookmarkBtn}
          onPress={() => setSaved((v) => !v)}
          hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
        >
          <Text style={[cardStyles.bookmarkIcon, { color: saved ? primary : 'rgba(255,255,255,0.5)' }]}>
            {saved ? '♥' : '♡'}
          </Text>
        </TouchableOpacity>
      </View>
      <View style={cardStyles.info}>
        <Text style={[cardStyles.venueName, { color: textPrimary }]} numberOfLines={1}>{venue.name}</Text>
        <View style={cardStyles.tagsRow}>
          {venue.vibeTags.map((tag) => (
            <View key={tag} style={[cardStyles.tag, { borderColor: `${primary}55` }]}>
              <Text style={[cardStyles.tagText, { color: primary }]}>{tag}</Text>
            </View>
          ))}
        </View>
        <View style={cardStyles.metaRow}>
          <Text style={[cardStyles.meta, { color: textSecondary }]}>{venue.hours}</Text>
          <View style={cardStyles.dot} />
          <Text style={[cardStyles.meta, { color: textSecondary }]}>Peak {venue.peakTime}</Text>
          <View style={cardStyles.dot} />
          <Text style={[cardStyles.meta, { color: primary }]}>{venue.priceTier}</Text>
        </View>
      </View>
    </View>
  );
}

const cardStyles = StyleSheet.create({
  card: { borderRadius: borderRadius['2xl'], borderWidth: 1, overflow: 'hidden', marginBottom: spacing[4] },
  imageWrap: { position: 'relative', height: 180 },
  image: { width: '100%', height: '100%' },
  matchBadge: {
    position: 'absolute', top: 12, left: 12,
    paddingHorizontal: 10, paddingVertical: 4, borderRadius: borderRadius.full,
  },
  matchText: { fontSize: fontSizes.sm, fontWeight: fontWeights.bold, color: '#000', letterSpacing: letterSpacings.wide },
  bookmarkBtn: { position: 'absolute', top: 10, right: 12 },
  bookmarkIcon: { fontSize: 22 },
  info: { padding: spacing[4], gap: spacing[2] },
  venueName: { fontSize: fontSizes.lg, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.tight },
  tagsRow: { flexDirection: 'row', gap: spacing[2], flexWrap: 'wrap' },
  tag: { borderWidth: 1, borderRadius: borderRadius.full, paddingHorizontal: spacing[3], paddingVertical: 3 },
  tagText: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wide },
  metaRow: { flexDirection: 'row', alignItems: 'center', gap: spacing[2], marginTop: 2 },
  meta: { fontSize: fontSizes.sm, fontWeight: fontWeights.medium },
  dot: { width: 3, height: 3, borderRadius: 2, backgroundColor: 'rgba(255,255,255,0.2)' },
});

function CitySelectorModal({ visible, onClose }: { visible: boolean; onClose: () => void }) {
  const { setCity, selectedCity } = useCityStore();

  return (
    <Modal visible={visible} transparent animationType="slide" onRequestClose={onClose}>
      <TouchableOpacity style={modalStyles.overlay} onPress={onClose} activeOpacity={1}>
        <View style={modalStyles.sheet}>
          <View style={modalStyles.handle} />
          <Text style={modalStyles.title}>SELECT CITY</Text>
          <FlatList
            data={cityList}
            keyExtractor={(item) => item.code}
            renderItem={({ item }) => {
              const cityTheme = cityThemes[item.code];
              const active = selectedCity === item.code;
              return (
                <TouchableOpacity
                  style={[modalStyles.cityRow, active && { backgroundColor: `${cityTheme.primary}18` }]}
                  onPress={() => { setCity(item.code); onClose(); }}
                >
                  <View style={[modalStyles.cityDot, { backgroundColor: cityTheme.primary }]} />
                  <Text style={[modalStyles.cityName, active && { color: cityTheme.primary }]}>{item.name}</Text>
                  {active && <Text style={[modalStyles.check, { color: cityTheme.primary }]}>✓</Text>}
                </TouchableOpacity>
              );
            }}
          />
        </View>
      </TouchableOpacity>
    </Modal>
  );
}

const modalStyles = StyleSheet.create({
  overlay: { flex: 1, backgroundColor: 'rgba(0,0,0,0.75)', justifyContent: 'flex-end' },
  sheet: {
    backgroundColor: '#0f0f0f',
    borderTopLeftRadius: borderRadius['3xl'], borderTopRightRadius: borderRadius['3xl'],
    paddingTop: spacing[4], paddingBottom: spacing[10],
    borderTopWidth: 1, borderTopColor: 'rgba(255,255,255,0.08)',
    maxHeight: SCREEN_H * 0.65,
  },
  handle: {
    width: 40, height: 4, borderRadius: 2,
    backgroundColor: 'rgba(255,255,255,0.15)', alignSelf: 'center', marginBottom: spacing[5],
  },
  title: {
    fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.ultraWide,
    color: 'rgba(255,255,255,0.4)', textAlign: 'center', marginBottom: spacing[4],
  },
  cityRow: {
    flexDirection: 'row', alignItems: 'center',
    paddingHorizontal: insets.screenHorizontal, paddingVertical: spacing[4],
    gap: spacing[4], borderRadius: borderRadius.lg,
    marginHorizontal: spacing[3], marginBottom: 2,
  },
  cityDot: { width: 8, height: 8, borderRadius: 4 },
  cityName: {
    flex: 1, fontSize: fontSizes.md, fontWeight: fontWeights.medium,
    color: 'rgba(255,255,255,0.75)', letterSpacing: letterSpacings.wide,
  },
  check: { fontSize: fontSizes.md, fontWeight: fontWeights.bold },
});

export default function RadarScreen() {
  const theme = useTheme();
  const insetsSafe = useSafeAreaInsets();
  const { selectedAura, setAura, selectedCity } = useCityStore();
  const [cityModalOpen, setCityModalOpen] = useState(false);
  const scrollY = useRef(new Animated.Value(0)).current;

  const headerOpacity = scrollY.interpolate({
    inputRange: [0, 120], outputRange: [0, 1], extrapolate: 'clamp',
  });

  const cityName = cityList.find((c) => c.code === selectedCity)?.name ?? 'New York';

  return (
    <View style={[styles.root, { backgroundColor: theme.background }]}>
      <Animated.View
        style={[
          styles.stickyHeader,
          { paddingTop: insetsSafe.top, backgroundColor: theme.background, borderBottomColor: theme.surface, opacity: headerOpacity },
        ]}
        pointerEvents="none"
      >
        <Text style={[styles.stickyLogo, { color: theme.primary }]}>WTW</Text>
      </Animated.View>

      <Animated.ScrollView
        style={styles.scroll}
        showsVerticalScrollIndicator={false}
        onScroll={Animated.event([{ nativeEvent: { contentOffset: { y: scrollY } } }], { useNativeDriver: true })}
        scrollEventThrottle={16}
      >
        {/* Hero */}
        <View style={[styles.hero, { paddingTop: insetsSafe.top + spacing[4] }]}>
          <View style={[styles.heroGradientOverlay, { backgroundColor: theme.background }]} />
          <View style={[styles.heroColorBleed, { backgroundColor: theme.primary, opacity: 0.06 }]} />

          <View style={styles.topBar}>
            <Text style={[styles.logo, { color: theme.primary }]}>WTW</Text>
            <TouchableOpacity
              style={[styles.citySelector, { borderColor: `${theme.primary}44` }]}
              onPress={() => setCityModalOpen(true)}
              activeOpacity={0.75}
            >
              <View style={[styles.citySelectorDot, { backgroundColor: theme.primary }]} />
              <Text style={[styles.citySelectorText, { color: theme.text.primary }]}>{cityName.toUpperCase()}</Text>
              <Text style={[styles.citySelectorChevron, { color: theme.primary }]}>›</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.headlineBlock}>
            <Text style={[styles.headline, { color: theme.text.primary }]}>
              The night is{'\n'}already moving.
            </Text>
            <Text style={[styles.tagline, { color: theme.primary }]}>{theme.tagline}</Text>
          </View>

          <View style={[styles.glowOrb, { backgroundColor: theme.primary, opacity: 0.12 }]} />
        </View>

        {/* Filter Tabs */}
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          style={styles.filterScroll}
          contentContainerStyle={styles.filterContent}
        >
          {FILTER_TABS.map((tab) => {
            const active = selectedAura === tab.aura;
            return (
              <TouchableOpacity
                key={tab.aura}
                style={[
                  styles.filterTab,
                  active ? { backgroundColor: theme.primary } : { borderColor: `${theme.primary}35`, borderWidth: 1 },
                ]}
                onPress={() => setAura(tab.aura)}
                activeOpacity={0.8}
              >
                <Text style={[styles.filterTabText, { color: active ? theme.text.inverse : theme.text.secondary }]}>
                  {tab.label}
                </Text>
              </TouchableOpacity>
            );
          })}
        </ScrollView>

        <View style={styles.body}>
          {/* Live Signal Panel */}
          <View style={[styles.signalPanel, { backgroundColor: theme.surfaceElevated, borderColor: `${theme.primary}30` }]}>
            <View style={styles.signalHeader}>
              <View style={styles.signalLive}>
                <View style={[styles.liveDot, { backgroundColor: theme.waveColor }]} />
                <Text style={[styles.signalLabel, { color: theme.text.tertiary }]}>LIVE SIGNAL</Text>
              </View>
              <Text style={[styles.momentumPct, { color: theme.momentumColor }]}>87%</Text>
            </View>
            <Text style={[styles.momentumLabel, { color: theme.text.secondary }]}>Momentum in {cityName}</Text>
            <View style={styles.waveRow}>
              <WaveBars color={theme.waveColor} />
              <View style={styles.signalMeta}>
                <Text style={[styles.signalMetaText, { color: theme.text.tertiary }]}>142 venues active</Text>
                <Text style={[styles.signalMetaText, { color: theme.text.tertiary }]}>↑ 12% vs last Friday</Text>
              </View>
            </View>
          </View>

          {/* Curated Waves */}
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <Text style={[styles.sectionTitle, { color: theme.text.tertiary }]}>CURATED WAVES</Text>
              <TouchableOpacity>
                <Text style={[styles.sectionLink, { color: theme.primary }]}>See All</Text>
              </TouchableOpacity>
            </View>
            {MOCK_VENUES.map((venue) => (
              <VenueCard
                key={venue.id}
                venue={venue}
                primary={theme.primary}
                textPrimary={theme.text.primary}
                textSecondary={theme.text.secondary}
                surface={theme.surface}
              />
            ))}
          </View>

          {/* City Highlights */}
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <Text style={[styles.sectionTitle, { color: theme.text.tertiary }]}>CITY HIGHLIGHTS</Text>
            </View>
            <View style={styles.highlightGrid}>
              {HIGHLIGHT_IMAGES.map((uri, i) => (
                <View
                  key={i}
                  style={[styles.highlightCell, i === 0 && styles.highlightCellLarge, { borderColor: `${theme.primary}20` }]}
                >
                  <Image source={{ uri }} style={styles.highlightImg} contentFit="cover" transition={300} />
                  <View style={styles.highlightOverlay} />
                </View>
              ))}
            </View>
          </View>

          <View style={{ height: spacing[12] }} />
        </View>
      </Animated.ScrollView>

      <CitySelectorModal visible={cityModalOpen} onClose={() => setCityModalOpen(false)} />
    </View>
  );
}

const GRID_CELL = (SCREEN_W - insets.screenHorizontal * 2 - spacing[2]) / 2;

const styles = StyleSheet.create({
  root: { flex: 1 },
  scroll: { flex: 1 },
  stickyHeader: {
    position: 'absolute', top: 0, left: 0, right: 0, zIndex: 100,
    paddingHorizontal: insets.screenHorizontal, paddingBottom: spacing[4],
    borderBottomWidth: 1, alignItems: 'center',
  },
  stickyLogo: { fontSize: fontSizes.base, fontWeight: fontWeights.black, letterSpacing: letterSpacings.ultraWide },
  hero: {
    minHeight: SCREEN_H * 0.50, paddingHorizontal: insets.screenHorizontal,
    paddingBottom: spacing[8], overflow: 'hidden', position: 'relative',
  },
  heroGradientOverlay: { ...StyleSheet.absoluteFillObject, opacity: 0.65 },
  heroColorBleed: { position: 'absolute', top: -80, right: -80, width: 300, height: 300, borderRadius: 150 },
  glowOrb: { position: 'absolute', bottom: -60, left: -40, width: 240, height: 240, borderRadius: 120 },
  topBar: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginBottom: spacing[8] },
  logo: { fontSize: fontSizes.base, fontWeight: fontWeights.black, letterSpacing: letterSpacings.ultraWide },
  citySelector: {
    flexDirection: 'row', alignItems: 'center', gap: spacing[2],
    borderWidth: 1, borderRadius: borderRadius.full,
    paddingHorizontal: spacing[4], paddingVertical: spacing[2],
  },
  citySelectorDot: { width: 6, height: 6, borderRadius: 3 },
  citySelectorText: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wider },
  citySelectorChevron: { fontSize: fontSizes.lg, lineHeight: fontSizes.lg, marginTop: -1 },
  headlineBlock: { marginTop: spacing[8], gap: spacing[3] },
  headline: {
    fontSize: fontSizes['3xl'], fontWeight: fontWeights.bold,
    lineHeight: fontSizes['3xl'] * lineHeights.tight, letterSpacing: letterSpacings.tightest,
  },
  tagline: {
    fontSize: fontSizes.base, fontStyle: 'italic', fontWeight: fontWeights.light,
    letterSpacing: letterSpacings.wide, lineHeight: fontSizes.base * lineHeights.relaxed, opacity: 0.9,
  },
  filterScroll: { marginTop: spacing[6] },
  filterContent: { paddingHorizontal: insets.screenHorizontal, gap: spacing[2], paddingBottom: spacing[2] },
  filterTab: { paddingHorizontal: spacing[5], paddingVertical: spacing[2] + 2, borderRadius: borderRadius.full },
  filterTabText: { fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.wider },
  body: { paddingHorizontal: insets.screenHorizontal, marginTop: spacing[6] },
  signalPanel: { borderRadius: borderRadius['2xl'], borderWidth: 1, padding: spacing[5], marginBottom: spacing[8], gap: spacing[3] },
  signalHeader: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  signalLive: { flexDirection: 'row', alignItems: 'center', gap: spacing[2] },
  liveDot: { width: 7, height: 7, borderRadius: 4 },
  signalLabel: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.widest },
  momentumPct: { fontSize: fontSizes['2xl'], fontWeight: fontWeights.black, letterSpacing: letterSpacings.tightest },
  momentumLabel: { fontSize: fontSizes.sm, fontWeight: fontWeights.medium, letterSpacing: letterSpacings.wide },
  waveRow: { flexDirection: 'row', alignItems: 'flex-end', justifyContent: 'space-between', marginTop: spacing[2] },
  signalMeta: { alignItems: 'flex-end', gap: 3 },
  signalMetaText: { fontSize: fontSizes.xs, fontWeight: fontWeights.medium, letterSpacing: letterSpacings.wide },
  section: { marginBottom: spacing[8] },
  sectionHeader: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginBottom: spacing[4] },
  sectionTitle: { fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.ultraWide },
  sectionLink: { fontSize: fontSizes.sm, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wide },
  highlightGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: spacing[2] },
  highlightCell: { width: GRID_CELL, height: GRID_CELL * 0.72, borderRadius: borderRadius.xl, overflow: 'hidden', borderWidth: 1 },
  highlightCellLarge: { width: '100%', height: GRID_CELL * 1.1 },
  highlightImg: { width: '100%', height: '100%' },
  highlightOverlay: { ...StyleSheet.absoluteFillObject, backgroundColor: 'rgba(0,0,0,0.25)' },
});
ENDOFFILE

# ─────────────────────────────────────────────────────────────────────────────
echo ""
echo "✅ Done! Files created:"
find app store design-system -type f | sort | sed 's/^/   /'
echo ""
echo "Next steps:"
echo "  git add ."
echo "  git commit -m 'feat: Session 1 — WTW foundation'"
echo "  git push -u origin claude/sleepy-dirac-TcROb"
