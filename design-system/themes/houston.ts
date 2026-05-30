import type { CityTheme } from './types';
export const houstonTheme: CityTheme = {
  city: 'Houston', cityCode: 'hou',
  background: '#0F0A06', primary: '#FB923C',
  primaryMuted: '#FB923C33', primaryGlow: '#FB923C66',
  surface: '#1A120A', surfaceElevated: '#231A10',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#0F0A06', accent: '#FB923C' },
  hero: { gradient: ['#0F0A06', '#1A1008', '#0F0A06'], overlayStart: 'rgba(15,10,6,0)', overlayEnd: 'rgba(15,10,6,0.95)' },
  tagline: 'H-Town — No days off',
  vibeWords: ['Space City', 'Trap House', 'Southern Luxury'],
  filterTabs: ['All', 'Hip-Hop', 'Lounge', 'Day Party', 'Late Night'],
  waveColor: '#FB923C', momentumColor: '#38BDF8',
};
