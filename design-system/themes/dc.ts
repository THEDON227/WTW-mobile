import type { CityTheme } from './types';
export const dcTheme: CityTheme = {
  city: 'Washington DC', cityCode: 'dc',
  background: '#080A0A', primary: '#2DD4BF',
  primaryMuted: '#2DD4BF33', primaryGlow: '#2DD4BF66',
  surface: '#101515', surfaceElevated: '#181E1E',
  text: { primary: '#F0EDE8', secondary: '#A09A8E', tertiary: '#5C5650', inverse: '#080A0A', accent: '#2DD4BF' },
  hero: { gradient: ['#080A0A', '#101515', '#080A0A'], overlayStart: 'rgba(8,10,10,0)', overlayEnd: 'rgba(8,10,10,0.95)' },
  tagline: 'Power moves after hours',
  vibeWords: ['Embassy Row', 'Power Circle', 'Capitol After Dark'],
  filterTabs: ['All', 'Upscale', 'Politics', 'Go-Go', 'Rooftop'],
  waveColor: '#2DD4BF', momentumColor: '#C084FC',
};
