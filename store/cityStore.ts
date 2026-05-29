import { create } from 'zustand';
import type { CityCode } from '../design-system/themes';

export type Aura =
  | 'all'
  | 'vip'
  | 'rooftop'
  | 'live-music'
  | 'after-hours';

interface CityState {
  selectedCity: CityCode;
  selectedAura: Aura;
  setCity: (city: CityCode) => void;
  setAura: (aura: Aura) => void;
}

export const useCityStore = create<CityState>((set) => ({
  selectedCity: 'nyc',
  selectedAura: 'all',
  setCity: (city) => set({ selectedCity: city }),
  setAura: (aura) => set({ selectedAura: aura }),
}));
