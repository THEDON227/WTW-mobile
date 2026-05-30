$ cat /home/user/options-bot/WTW-mobile/wtw-nuclear.sh

#!/bin/bash
set -e

echo "=== WTW NUCLEAR RESET ==="
echo "Deleting all existing source files..."

rm -rf app/ design-system/ store/

echo "Recreating directory structure..."
mkdir -p app/"(tabs)"
mkdir -p design-system/themes
mkdir -p store

# ─────────────────────────────────────────────
# 1. design-system/themes/types.ts
# NO imports — pure type declarations only
# ─────────────────────────────────────────────
cat > design-system/themes/types.ts << 'HEREDOC'
export type CityCode =
  | 'nyc'
  | 'miami'
  | 'la'
  | 'atl'
  | 'hou'
  | 'nj'
  | 'phl'
  | 'chi'
  | 'dc'
  | 'las';

export interface CityTheme {
  city: string;
  cityCode: CityCode;
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
HEREDOC

echo "✓ design-system/themes/types.ts"

# ─────────────────────────────────────────────
# 2. City theme files — each imports ONLY from ./types
# ─────────────────────────────────────────────
cat > design-system/themes/nyc.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const nycTheme: CityTheme = {
  city: 'New York City',
  cityCode: 'nyc',
  background: '#0A0A0F',
  primary: '#C9A84C',
  primaryMuted: '#C9A84C33',
  primaryGlow: '#C9A84C66',
  surface: '#12121A',
  surfaceElevated: '#1A1A26',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#0A0A0F',
    accent: '#C9A84C',
  },
  hero: {
    gradient: ['#0A0A0F', '#1A1420', '#0A0A0F'],
    overlayStart: 'rgba(10,10,15,0)',
    overlayEnd: 'rgba(10,10,15,0.95)',
  },
  tagline: 'The city that never sleeps',
  vibeWords: ['Manhattan Energy', 'Rooftop Season', 'After Dark'],
  filterTabs: ['All', 'VIP', 'Rooftop', 'Live Music', 'After Hours'],
  waveColor: '#C9A84C',
  momentumColor: '#8B6FBF',
};
HEREDOC

echo "✓ design-system/themes/nyc.ts"

cat > design-system/themes/miami.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const miamiTheme: CityTheme = {
  city: 'Miami',
  cityCode: 'miami',
  background: '#060B14',
  primary: '#FF6B9D',
  primaryMuted: '#FF6B9D33',
  primaryGlow: '#FF6B9D66',
  surface: '#0D1520',
  surfaceElevated: '#141E2E',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#060B14',
    accent: '#FF6B9D',
  },
  hero: {
    gradient: ['#060B14', '#0D1A2A', '#060B14'],
    overlayStart: 'rgba(6,11,20,0)',
    overlayEnd: 'rgba(6,11,20,0.95)',
  },
  tagline: 'Where the night never ends',
  vibeWords: ['South Beach Heat', 'Pool Party', 'Rooftop Vibes'],
  filterTabs: ['All', 'Beach Club', 'Pool Party', 'Live DJ', 'Late Night'],
  waveColor: '#FF6B9D',
  momentumColor: '#00D4FF',
};
HEREDOC

echo "✓ design-system/themes/miami.ts"

cat > design-system/themes/la.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const laTheme: CityTheme = {
  city: 'Los Angeles',
  cityCode: 'la',
  background: '#0A080F',
  primary: '#A78BFA',
  primaryMuted: '#A78BFA33',
  primaryGlow: '#A78BFA66',
  surface: '#120F1A',
  surfaceElevated: '#1A1526',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#0A080F',
    accent: '#A78BFA',
  },
  hero: {
    gradient: ['#0A080F', '#150F20', '#0A080F'],
    overlayStart: 'rgba(10,8,15,0)',
    overlayEnd: 'rgba(10,8,15,0.95)',
  },
  tagline: 'Where the stars come out to play',
  vibeWords: ['Sunset Strip', 'Hollywood Hills', 'Exclusive Access'],
  filterTabs: ['All', 'Celebrity', 'Rooftop', 'Industry', 'After Party'],
  waveColor: '#A78BFA',
  momentumColor: '#F59E0B',
};
HEREDOC

echo "✓ design-system/themes/la.ts"

cat > design-system/themes/atlanta.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const atlantaTheme: CityTheme = {
  city: 'Atlanta',
  cityCode: 'atl',
  background: '#080A08',
  primary: '#4ADE80',
  primaryMuted: '#4ADE8033',
  primaryGlow: '#4ADE8066',
  surface: '#0F120F',
  surfaceElevated: '#161A16',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#080A08',
    accent: '#4ADE80',
  },
  hero: {
    gradient: ['#080A08', '#101510', '#080A08'],
    overlayStart: 'rgba(8,10,8,0)',
    overlayEnd: 'rgba(8,10,8,0.95)',
  },
  tagline: 'ATL — The culture capital',
  vibeWords: ['Trap Nation', 'Buckhead Scene', 'Culture First'],
  filterTabs: ['All', 'Hip-Hop', 'Trap', 'Rooftop', 'Industry'],
  waveColor: '#4ADE80',
  momentumColor: '#F97316',
};
HEREDOC

echo "✓ design-system/themes/atlanta.ts"

cat > design-system/themes/houston.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const houstonTheme: CityTheme = {
  city: 'Houston',
  cityCode: 'hou',
  background: '#0F0A06',
  primary: '#FB923C',
  primaryMuted: '#FB923C33',
  primaryGlow: '#FB923C66',
  surface: '#1A120A',
  surfaceElevated: '#231A10',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#0F0A06',
    accent: '#FB923C',
  },
  hero: {
    gradient: ['#0F0A06', '#1A1008', '#0F0A06'],
    overlayStart: 'rgba(15,10,6,0)',
    overlayEnd: 'rgba(15,10,6,0.95)',
  },
  tagline: 'H-Town — No days off',
  vibeWords: ['Space City', 'Trap House', 'Southern Luxury'],
  filterTabs: ['All', 'Hip-Hop', 'Lounge', 'Day Party', 'Late Night'],
  waveColor: '#FB923C',
  momentumColor: '#38BDF8',
};
HEREDOC

echo "✓ design-system/themes/houston.ts"

cat > design-system/themes/nj.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const njTheme: CityTheme = {
  city: 'New Jersey',
  cityCode: 'nj',
  background: '#08080F',
  primary: '#60A5FA',
  primaryMuted: '#60A5FA33',
  primaryGlow: '#60A5FA66',
  surface: '#10101A',
  surfaceElevated: '#181826',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#08080F',
    accent: '#60A5FA',
  },
  hero: {
    gradient: ['#08080F', '#10101A', '#08080F'],
    overlayStart: 'rgba(8,8,15,0)',
    overlayEnd: 'rgba(8,8,15,0.95)',
  },
  tagline: 'The real Garden State after dark',
  vibeWords: ['Shore Nights', 'Urban Energy', 'Tri-State Vibes'],
  filterTabs: ['All', 'Club', 'Lounge', 'Shore', 'Late Night'],
  waveColor: '#60A5FA',
  momentumColor: '#F472B6',
};
HEREDOC

echo "✓ design-system/themes/nj.ts"

cat > design-system/themes/philly.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const phillyTheme: CityTheme = {
  city: 'Philadelphia',
  cityCode: 'phl',
  background: '#0A0606',
  primary: '#F87171',
  primaryMuted: '#F8717133',
  primaryGlow: '#F8717166',
  surface: '#150C0C',
  surfaceElevated: '#1E1212',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#0A0606',
    accent: '#F87171',
  },
  hero: {
    gradient: ['#0A0606', '#150A0A', '#0A0606'],
    overlayStart: 'rgba(10,6,6,0)',
    overlayEnd: 'rgba(10,6,6,0.95)',
  },
  tagline: 'The city of brotherly love — after dark',
  vibeWords: ['Broad Street', 'Philly Raw', 'City of Grit'],
  filterTabs: ['All', 'R&B', 'Hip-Hop', 'Rooftop', 'Underground'],
  waveColor: '#F87171',
  momentumColor: '#34D399',
};
HEREDOC

echo "✓ design-system/themes/philly.ts"

cat > design-system/themes/chicago.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const chicagoTheme: CityTheme = {
  city: 'Chicago',
  cityCode: 'chi',
  background: '#050A14',
  primary: '#38BDF8',
  primaryMuted: '#38BDF833',
  primaryGlow: '#38BDF866',
  surface: '#0A1220',
  surfaceElevated: '#101A2E',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#050A14',
    accent: '#38BDF8',
  },
  hero: {
    gradient: ['#050A14', '#0A1220', '#050A14'],
    overlayStart: 'rgba(5,10,20,0)',
    overlayEnd: 'rgba(5,10,20,0.95)',
  },
  tagline: 'The Windy City never stops',
  vibeWords: ['Chi-Town Energy', 'House Music', 'Lake Shore'],
  filterTabs: ['All', 'House', 'R&B', 'Rooftop', 'Late Night'],
  waveColor: '#38BDF8',
  momentumColor: '#FB7185',
};
HEREDOC

echo "✓ design-system/themes/chicago.ts"

cat > design-system/themes/dc.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const dcTheme: CityTheme = {
  city: 'Washington DC',
  cityCode: 'dc',
  background: '#080A0A',
  primary: '#2DD4BF',
  primaryMuted: '#2DD4BF33',
  primaryGlow: '#2DD4BF66',
  surface: '#101515',
  surfaceElevated: '#181E1E',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#080A0A',
    accent: '#2DD4BF',
  },
  hero: {
    gradient: ['#080A0A', '#101515', '#080A0A'],
    overlayStart: 'rgba(8,10,10,0)',
    overlayEnd: 'rgba(8,10,10,0.95)',
  },
  tagline: 'Power moves after hours',
  vibeWords: ['Embassy Row', 'Power Circle', 'Capitol After Dark'],
  filterTabs: ['All', 'Upscale', 'Politics', 'Go-Go', 'Rooftop'],
  waveColor: '#2DD4BF',
  momentumColor: '#C084FC',
};
HEREDOC

echo "✓ design-system/themes/dc.ts"

cat > design-system/themes/lasvegas.ts << 'HEREDOC'
import type { CityTheme } from './types';

export const lasvegasTheme: CityTheme = {
  city: 'Las Vegas',
  cityCode: 'las',
  background: '#0A0600',
  primary: '#FBBF24',
  primaryMuted: '#FBBF2433',
  primaryGlow: '#FBBF2466',
  surface: '#150E00',
  surfaceElevated: '#1E1600',
  text: {
    primary: '#F0EDE8',
    secondary: '#A09A8E',
    tertiary: '#5C5650',
    inverse: '#0A0600',
    accent: '#FBBF24',
  },
  hero: {
    gradient: ['#0A0600', '#150E00', '#0A0600'],
    overlayStart: 'rgba(10,6,0,0)',
    overlayEnd: 'rgba(10,6,0,0.95)',
  },
  tagline: 'What happens here, starts here',
  vibeWords: ['Strip Energy', 'High Roller', 'All Night'],
  filterTabs: ['All', 'Casino', 'Club', 'Pool Party', 'VIP'],
  waveColor: '#FBBF24',
  momentumColor: '#F472B6',
};
HEREDOC

echo "✓ design-system/themes/lasvegas.ts"

# ─────────────────────────────────────────────
# 3. design-system/themes/index.ts
# Imports from ./types (for types) + city files (for values)
# No circular dependency possible
# ─────────────────────────────────────────────
cat > design-system/themes/index.ts << 'HEREDOC'
import type { CityCode, CityTheme } from './types';
import { nycTheme } from './nyc';
import { miamiTheme } from './miami';
import { laTheme } from './la';
import { atlantaTheme } from './atlanta';
import { houstonTheme } from './houston';
import { njTheme } from './nj';
import { phillyTheme } from './philly';
import { chicagoTheme } from './chicago';
import { dcTheme } from './dc';
import { lasvegasTheme } from './lasvegas';

export type { CityCode, CityTheme };

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
  las: lasvegasTheme,
};

export const cityList: { code: CityCode; name: string }[] = [
  { code: 'nyc', name: 'New York City' },
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
HEREDOC

echo "✓ design-system/themes/index.ts"

# ─────────────────────────────────────────────
# 4. design-system/ThemeProvider.tsx
# ─────────────────────────────────────────────
cat > design-system/ThemeProvider.tsx << 'HEREDOC'
import React, { createContext, useContext } from 'react';
import type { CityTheme } from './themes/types';
import { cityThemes } from './themes/index';
import { useCityStore } from '../store/cityStore';

const ThemeContext = createContext<CityTheme>(cityThemes.nyc);

export function ThemeProvider({ children }: { children: React.ReactNode }) {
  const selectedCity = useCityStore((s) => s.selectedCity);
  const theme = cityThemes[selectedCity] ?? cityThemes.nyc;
  return <ThemeContext.Provider value={theme}>{children}</ThemeContext.Provider>;
}

export function useTheme(): CityTheme {
  return useContext(ThemeContext);
}
HEREDOC

echo "✓ design-system/ThemeProvider.tsx"

# ─────────────────────────────────────────────
# 5. store/cityStore.ts
# ─────────────────────────────────────────────
cat > store/cityStore.ts << 'HEREDOC'
import { create } from 'zustand';
import type { CityCode } from '../design-system/themes/types';

export type Aura = 'all' | 'vip' | 'rooftop' | 'live-music' | 'after-hours';

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
HEREDOC

echo "✓ store/cityStore.ts"

# ─────────────────────────────────────────────
# 6. app/_layout.tsx
# ─────────────────────────────────────────────
cat > app/_layout.tsx << 'HEREDOC'
import { Slot } from 'expo-router';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { ThemeProvider } from '../design-system/ThemeProvider';

export default function RootLayout() {
  return (
    <SafeAreaProvider>
      <ThemeProvider>
        <StatusBar style="light" />
        <Slot />
      </ThemeProvider>
    </SafeAreaProvider>
  );
}
HEREDOC

echo "✓ app/_layout.tsx"

# ─────────────────────────────────────────────
# 7. app/(tabs)/_layout.tsx
# ─────────────────────────────────────────────
cat > "app/(tabs)/_layout.tsx" << 'HEREDOC'
import { Tabs } from 'expo-router';
import { useTheme } from '../../design-system/ThemeProvider';

export default function TabsLayout() {
  const theme = useTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarStyle: {
          backgroundColor: theme.background,
          borderTopColor: 'rgba(255,255,255,0.06)',
          borderTopWidth: 1,
          height: 60,
          paddingBottom: 8,
        },
        tabBarActiveTintColor: theme.primary,
        tabBarInactiveTintColor: 'rgba(255,255,255,0.35)',
        tabBarLabelStyle: {
          fontSize: 10,
          fontWeight: '600',
          letterSpacing: 2,
        },
      }}
    >
      <Tabs.Screen name="index" options={{ title: 'RADAR' }} />
      <Tabs.Screen name="explore" options={{ title: 'EXPLORE' }} />
      <Tabs.Screen name="saved" options={{ title: 'SAVED' }} />
      <Tabs.Screen name="profile" options={{ title: 'PROFILE' }} />
    </Tabs>
  );
}
HEREDOC

echo "✓ app/(tabs)/_layout.tsx"

# ─────────────────────────────────────────────
# 8. app/(tabs)/index.tsx — MINIMAL radar screen
# ─────────────────────────────────────────────
cat > "app/(tabs)/index.tsx" << 'HEREDOC'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function RadarScreen() {
  const theme = useTheme();

  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.logo, { color: theme.primary }]}>WTW</Text>
      <Text style={[styles.sub, { color: theme.text.secondary }]}>
        Where's The Wave
      </Text>
      <Text style={[styles.city, { color: theme.text.tertiary }]}>
        {theme.city}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  logo: {
    fontSize: 72,
    fontWeight: '900',
    letterSpacing: 8,
  },
  sub: {
    fontSize: 16,
    letterSpacing: 4,
    marginTop: 8,
  },
  city: {
    fontSize: 12,
    letterSpacing: 3,
    marginTop: 16,
    textTransform: 'uppercase',
  },
});
HEREDOC

echo "✓ app/(tabs)/index.tsx"

# ─────────────────────────────────────────────
# 9. app/(tabs)/explore.tsx
# ─────────────────────────────────────────────
cat > "app/(tabs)/explore.tsx" << 'HEREDOC'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function ExploreScreen() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.label, { color: theme.text.secondary }]}>EXPLORE</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  label: { fontSize: 14, letterSpacing: 4 },
});
HEREDOC

echo "✓ app/(tabs)/explore.tsx"

# ─────────────────────────────────────────────
# 10. app/(tabs)/saved.tsx
# ─────────────────────────────────────────────
cat > "app/(tabs)/saved.tsx" << 'HEREDOC'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function SavedScreen() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.label, { color: theme.text.secondary }]}>SAVED</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  label: { fontSize: 14, letterSpacing: 4 },
});
HEREDOC

echo "✓ app/(tabs)/saved.tsx"

# ─────────────────────────────────────────────
# 11. app/(tabs)/profile.tsx
# ─────────────────────────────────────────────
cat > "app/(tabs)/profile.tsx" << 'HEREDOC'
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';

export default function ProfileScreen() {
  const theme = useTheme();
  return (
    <View style={[styles.container, { backgroundColor: theme.background }]}>
      <Text style={[styles.label, { color: theme.text.secondary }]}>PROFILE</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  label: { fontSize: 14, letterSpacing: 4 },
});
HEREDOC

echo "✓ app/(tabs)/profile.tsx"

echo ""
echo "=== WTW NUCLEAR RESET COMPLETE ==="
echo ""
echo "Files created:"
echo "  design-system/themes/types.ts     (no imports)"
echo "  design-system/themes/nyc.ts       (imports ./types only)"
echo "  design-system/themes/miami.ts     (imports ./types only)"
echo "  design-system/themes/la.ts        (imports ./types only)"
echo "  design-system/themes/atlanta.ts   (imports ./types only)"
echo "  design-system/themes/houston.ts   (imports ./types only)"
echo "  design-system/themes/nj.ts        (imports ./types only)"
echo "  design-system/themes/philly.ts    (imports ./types only)"
echo "  design-system/themes/chicago.ts   (imports ./types only)"
echo "  design-system/themes/dc.ts        (imports ./types only)"
echo "  design-system/themes/lasvegas.ts  (imports ./types only)"
echo "  design-system/themes/index.ts     (imports types + city files)"
echo "  design-system/ThemeProvider.tsx"
echo "  store/cityStore.ts"
echo "  app/_layout.tsx"
echo "  app/(tabs)/_layout.tsx"
echo "  app/(tabs)/index.tsx"
echo "  app/(tabs)/explore.tsx"
echo "  app/(tabs)/saved.tsx"
echo "  app/(tabs)/profile.tsx"
echo ""
echo "=== NOW RUN ==="
echo ""
echo "  npx expo start --web --clear"
echo ""
echo "You should see a dark screen with 'WTW' in gold and 4 bottom tabs."
