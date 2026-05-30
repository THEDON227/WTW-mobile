import type { CityTheme } from './types';
export const phillyTheme: CityTheme = {
  city: 'Philadelphia', cityCode: 'phl',
  background: '#0A0606', primary: '#F87171',
  primaryMuted: '#F8717133', primaryGlow: '#F8717166',
  surface: '#150C0C', surfaceElevated: '#1E1212',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#0A0606', accent: '#F87171' },
  hero: { gradient: ['#0A0606', '#150A0A', '#0A0606'], overlayStart: 'rgba(10,6,6,0)', overlayEnd: 'rgba(10,6,6,0.95)' },
  tagline: 'The city of brotherly love — after dark',
  vibeWords: ['Broad Street', 'Philly Raw', 'City of Grit'],
  filterTabs: ['All', 'R&B', 'Hip-Hop', 'Rooftop', 'Underground'],
  waveColor: '#F87171', momentumColor: '#34D399',
};
