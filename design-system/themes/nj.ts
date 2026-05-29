import type { CityTheme } from './index';

export const njTheme: CityTheme = {
  city: 'New Jersey',
  cityCode: 'nj',
  background: '#00060f',
  primary: '#0EA5E9',
  primaryMuted: 'rgba(14,165,233,0.18)',
  primaryGlow: 'rgba(14,165,233,0.45)',
  surface: 'rgba(14,165,233,0.06)',
  surfaceElevated: 'rgba(14,165,233,0.11)',
  text: {
    primary: '#E0F2FE',
    secondary: 'rgba(224,242,254,0.65)',
    tertiary: 'rgba(224,242,254,0.35)',
    inverse: '#00060f',
    accent: '#0EA5E9',
  },
  hero: {
    gradient: ['#00060f', '#000e1f', '#00152e'],
    overlayStart: 'rgba(0,6,15,0.00)',
    overlayEnd: 'rgba(0,6,15,0.92)',
  },
  tagline: 'Skyline views. No tourist tax.',
  vibeWords: ['Waterfront', 'Skyline', 'Late Night', 'Lounge', 'Upscale'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#0EA5E9',
  momentumColor: '#7DD3FC',
};
