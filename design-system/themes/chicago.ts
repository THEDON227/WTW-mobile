import type { CityTheme } from './types';
export const chicagoTheme: CityTheme = {
  city: 'Chicago', cityCode: 'chi',
  background: '#050A14', primary: '#38BDF8',
  primaryMuted: '#38BDF833', primaryGlow: '#38BDF866',
  surface: '#0A1220', surfaceElevated: '#101A2E',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#050A14', accent: '#38BDF8' },
  hero: { gradient: ['#050A14', '#0A1220', '#050A14'], overlayStart: 'rgba(5,10,20,0)', overlayEnd: 'rgba(5,10,20,0.95)' },
  tagline: 'The Windy City never stops',
  vibeWords: ['Chi-Town Energy', 'House Music', 'Lake Shore'],
  filterTabs: ['All', 'House', 'R&B', 'Rooftop', 'Late Night'],
  waveColor: '#38BDF8', momentumColor: '#FB7185',
};
