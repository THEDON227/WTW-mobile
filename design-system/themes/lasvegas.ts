import type { CityTheme } from './types';
export const lasvegasTheme: CityTheme = {
  city: 'Las Vegas', cityCode: 'las',
  background: '#0A0600', primary: '#FBBF24',
  primaryMuted: '#FBBF2433', primaryGlow: '#FBBF2466',
  surface: '#150E00', surfaceElevated: '#1E1600',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#0A0600', accent: '#FBBF24' },
  hero: { gradient: ['#0A0600', '#150E00', '#0A0600'], overlayStart: 'rgba(10,6,0,0)', overlayEnd: 'rgba(10,6,0,0.95)' },
  tagline: 'What happens here, starts here',
  vibeWords: ['Strip Energy', 'High Roller', 'All Night'],
  filterTabs: ['All', 'Casino', 'Club', 'Pool Party', 'VIP'],
  waveColor: '#FBBF24', momentumColor: '#F472B6',
};
