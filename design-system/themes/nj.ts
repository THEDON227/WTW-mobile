import type { CityTheme } from './types';
export const njTheme: CityTheme = {
  city: 'New Jersey', cityCode: 'nj',
  background: '#08080F', primary: '#60A5FA',
  primaryMuted: '#60A5FA33', primaryGlow: '#60A5FA66',
  surface: '#10101A', surfaceElevated: '#181826',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#08080F', accent: '#60A5FA' },
  hero: { gradient: ['#08080F', '#10101A', '#08080F'], overlayStart: 'rgba(8,8,15,0)', overlayEnd: 'rgba(8,8,15,0.95)' },
  tagline: 'The real Garden State after dark',
  vibeWords: ['Shore Nights', 'Urban Energy', 'Tri-State Vibes'],
  filterTabs: ['All', 'Club', 'Lounge', 'Shore', 'Late Night'],
  waveColor: '#60A5FA', momentumColor: '#F472B6',
};
