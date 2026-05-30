import type { CityTheme } from './types';
export const atlantaTheme: CityTheme = {
  city: 'Atlanta', cityCode: 'atl',
  background: '#080A08', primary: '#4ADE80',
  primaryMuted: '#4ADE8033', primaryGlow: '#4ADE8066',
  surface: '#0F120F', surfaceElevated: '#161A16',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#080A08', accent: '#4ADE80' },
  hero: { gradient: ['#080A08', '#101510', '#080A08'], overlayStart: 'rgba(8,10,8,0)', overlayEnd: 'rgba(8,10,8,0.95)' },
  tagline: 'ATL — The culture capital',
  vibeWords: ['Trap Nation', 'Buckhead Scene', 'Culture First'],
  filterTabs: ['All', 'Hip-Hop', 'Trap', 'Rooftop', 'Industry'],
  waveColor: '#4ADE80', momentumColor: '#F97316',
};
