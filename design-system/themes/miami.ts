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
