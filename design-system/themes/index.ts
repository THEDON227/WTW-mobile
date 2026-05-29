export interface CityTheme {
  city: string;
  cityCode: string;
  background: string;
  primary: string;
  primaryMuted: string;
  primaryGlow: string;
  surface: string;
  surfaceElevated: string;
  text: {
    primary: string;
    secondary: string;
    tertiary: string;
    inverse: string;
    accent: string;
  };
  hero: {
    gradient: string[];
    overlayStart: string;
    overlayEnd: string;
  };
  tagline: string;
  vibeWords: string[];
  filterTabs: string[];
  waveColor: string;
  momentumColor: string;
}

export type CityCode = 'nyc' | 'miami' | 'la' | 'atl' | 'hou' | 'nj' | 'phl' | 'chi' | 'dc' | 'las';

export { nycTheme } from './nyc';
export { miamiTheme } from './miami';
export { laTheme } from './la';
export { atlantaTheme } from './atlanta';
export { houstonTheme } from './houston';
export { njTheme } from './nj';
export { phillyTheme } from './philly';
export { chicagoTheme } from './chicago';
export { dcTheme } from './dc';
export { lasVegasTheme } from './lasvegas';

import { nycTheme } from './nyc';
import { miamiTheme } from './miami';
import { laTheme } from './la';
import { atlantaTheme } from './atlanta';
import { houstonTheme } from './houston';
import { njTheme } from './nj';
import { phillyTheme } from './philly';
import { chicagoTheme } from './chicago';
import { dcTheme } from './dc';
import { lasVegasTheme } from './lasvegas';

export const cityThemes: Record<CityCode, CityTheme> = {
  nyc: nycTheme,
  miami: miamiTheme,
  la: laTheme,
  atl: atlantaTheme,
  hou: houstonTheme,
  nj: njTheme,
  phl: phillyTheme,
  chi: chicagoTheme,
  dc: dcTheme,
  las: lasVegasTheme,
};

export const cityList: { code: CityCode; name: string }[] = [
  { code: 'nyc', name: 'New York' },
  { code: 'miami', name: 'Miami' },
  { code: 'la', name: 'Los Angeles' },
  { code: 'atl', name: 'Atlanta' },
  { code: 'hou', name: 'Houston' },
  { code: 'nj', name: 'New Jersey' },
  { code: 'phl', name: 'Philadelphia' },
  { code: 'chi', name: 'Chicago' },
  { code: 'dc', name: 'Washington DC' },
  { code: 'las', name: 'Las Vegas' },
];
