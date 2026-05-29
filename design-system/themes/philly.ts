import type { CityTheme } from './index';

export const phillyTheme: CityTheme = {
  city: 'Philadelphia',
  cityCode: 'phl',
  background: '#00080a',
  primary: '#06B6D4',
  primaryMuted: 'rgba(6,182,212,0.18)',
  primaryGlow: 'rgba(6,182,212,0.45)',
  surface: 'rgba(6,182,212,0.06)',
  surfaceElevated: 'rgba(6,182,212,0.11)',
  text: {
    primary: '#CFFAFE',
    secondary: 'rgba(207,250,254,0.65)',
    tertiary: 'rgba(207,250,254,0.35)',
    inverse: '#00080a',
    accent: '#06B6D4',
  },
  hero: {
    gradient: ['#00080a', '#001418', '#001c22'],
    overlayStart: 'rgba(0,8,10,0.00)',
    overlayEnd: 'rgba(0,8,10,0.92)',
  },
  tagline: 'The city that invented the underground.',
  vibeWords: ['Raw', 'Authentic', 'Jazz', 'After Hours', 'Industrial'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#06B6D4',
  momentumColor: '#67E8F9',
};
