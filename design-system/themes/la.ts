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
