import type { CityTheme } from './types';
export const miamiTheme: CityTheme = {
  city: 'Miami', cityCode: 'miami',
  background: '#060B14', primary: '#FF6B9D',
  primaryMuted: '#FF6B9D33', primaryGlow: '#FF6B9D66',
  surface: '#0D1520', surfaceElevated: '#141E2E',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#060B14', accent: '#FF6B9D' },
  hero: { gradient: ['#060B14', '#0D1A2A', '#060B14'], overlayStart: 'rgba(6,11,20,0)', overlayEnd: 'rgba(6,11,20,0.95)' },
  tagline: 'Where the night never ends',
  vibeWords: ['South Beach Heat', 'Pool Party', 'Rooftop Vibes'],
  filterTabs: ['All', 'Beach Club', 'Pool Party', 'Live DJ', 'Late Night'],
  waveColor: '#FF6B9D', momentumColor: '#00D4FF',
};
