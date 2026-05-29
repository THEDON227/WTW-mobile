import React, { createContext, useContext } from 'react';
import { useCityStore } from '../store/cityStore';
import { cityThemes } from './themes';
import type { CityTheme } from './themes';

const ThemeContext = createContext<CityTheme>(cityThemes.nyc);

export function ThemeProvider({ children }: { children: React.ReactNode }) {
  const selectedCity = useCityStore((s) => s.selectedCity);
  const theme = cityThemes[selectedCity];

  return (
    <ThemeContext.Provider value={theme}>
      {children}
    </ThemeContext.Provider>
  );
}

export function useTheme(): CityTheme {
  return useContext(ThemeContext);
}
