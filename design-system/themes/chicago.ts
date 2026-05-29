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
