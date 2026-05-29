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
