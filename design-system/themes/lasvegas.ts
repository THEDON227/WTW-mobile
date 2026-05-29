import type { CityTheme } from './index';

export const lasVegasTheme: CityTheme = {
  city: 'Las Vegas',
  cityCode: 'las',
  background: '#080500',
  primary: '#F59E0B',
  primaryMuted: 'rgba(245,158,11,0.22)',
  primaryGlow: 'rgba(245,158,11,0.55)',
  surface: 'rgba(245,158,11,0.07)',
  surfaceElevated: 'rgba(245,158,11,0.13)',
  text: {
    primary: '#FFFBEB',
    secondary: 'rgba(255,251,235,0.65)',
    tertiary: 'rgba(255,251,235,0.35)',
    inverse: '#080500',
    accent: '#F59E0B',
  },
  hero: {
    gradient: ['#080500', '#160d00', '#221600'],
    overlayStart: 'rgba(8,5,0,0.00)',
    overlayEnd: 'rgba(8,5,0,0.92)',
  },
  tagline: 'The strip never runs out of signal.',
  vibeWords: ['Casino', 'Spectacle', 'EDM', 'Dayclub', 'Residency'],
  filterTabs: ['ALL', 'VIP TABLES', 'ROOFTOPS', 'LIVE MUSIC', 'AFTER HOURS'],
  waveColor: '#F59E0B',
  momentumColor: '#FDE68A',
};
