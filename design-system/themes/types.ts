export type CityCode =
  | 'nyc'
  | 'miami'
  | 'la'
  | 'atl'
  | 'hou'
  | 'nj'
  | 'phl'
  | 'chi'
  | 'dc'
  | 'las';

export interface CityTheme {
  city: string;
  cityCode: CityCode;
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
