import type { CityTheme } from './types';
export const laTheme: CityTheme = {
  city: 'Los Angeles', cityCode: 'la',
  background: '#0A080F', primary: '#A78BFA',
  primaryMuted: '#A78BFA33', primaryGlow: '#A78BFA66',
  surface: '#120F1A', surfaceElevated: '#1A1526',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#0A080F', accent: '#A78BFA' },
  hero: { gradient: ['#0A080F', '#150F20', '#0A080F'], overlayStart: 'rgba(10,8,15,0)', overlayEnd: 'rgba(10,8,15,0.95)' },
  tagline: 'Where the stars come out to play',
  vibeWords: ['Sunset Strip', 'Hollywood Hills', 'Exclusive Access'],
  filterTabs: ['All', 'Celebrity', 'Rooftop', 'Industry', 'After Party'],
  waveColor: '#A78BFA', momentumColor: '#F59E0B',
};
