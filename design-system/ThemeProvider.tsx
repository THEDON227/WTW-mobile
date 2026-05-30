import React, { createContext, useContext } from 'react';
import type { CityTheme } from './themes/types';
import { cityThemes } from './themes/index';
import { useCityStore } from '../store/cityStore';

const ThemeContext = createContext<CityTheme>(cityThemes.nyc);

export function ThemeProvider({ children }: { children: React.ReactNode }) {
  const selectedCity = useCityStore((s) => s.selectedCity);
  const theme = cityThemes[selectedCity] ?? cityThemes.nyc;
  return <ThemeContext.Provider value={theme}>{children}</ThemeContext.Provider>;
}

export function useTheme(): CityTheme {
  return useContext(ThemeContext);
}
