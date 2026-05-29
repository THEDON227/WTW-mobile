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
