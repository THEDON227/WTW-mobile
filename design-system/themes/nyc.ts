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
