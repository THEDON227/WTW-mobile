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
