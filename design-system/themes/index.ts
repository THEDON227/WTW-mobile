import type { CityCode, CityTheme } from './types';
import { nycTheme } from './nyc';
import { miamiTheme } from './miami';
import { laTheme } from './la';
import { atlantaTheme } from './atlanta';
import { houstonTheme } from './houston';
import { njTheme } from './nj';
import { phillyTheme } from './philly';
import { chicagoTheme } from './chicago';
import { dcTheme } from './dc';
import { lasvegasTheme } from './lasvegas';

export type { CityCode, CityTheme };

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
  las: lasvegasTheme,
};

export const cityList: { code: CityCode; name: string }[] = [
  { code: 'nyc', name: 'New York City' },
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
