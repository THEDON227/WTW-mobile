import type { CityTheme } from './types';
export const nycTheme: CityTheme = {
  city: 'New York City', cityCode: 'nyc',
  background: '#0A0A0F', primary: '#C9A84C',
  primaryMuted: '#C9A84C33', primaryGlow: '#C9A84C66',
  surface: '#12121A', surfaceElevated: '#1A1A26',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#0A0A0F', accent: '#C9A84C' },
  hero: { gradient: ['#0A0A0F', '#1A1420', '#0A0A0F'], overlayStart: 'rgba(10,10,15,0)', overlayEnd: 'rgba(10,10,15,0.95)' },
  tagline: 'The city that never sleeps',
  vibeWords: ['Manhattan Energy', 'Rooftop Season', 'After Dark'],
  filterTabs: ['All', 'VIP', 'Rooftop', 'Live Music', 'After Hours'],
  waveColor: '#C9A84C', momentumColor: '#8B6FBF',
};
