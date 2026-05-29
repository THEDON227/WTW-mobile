import React, { useState, useRef } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  Dimensions,
  Animated,
  Modal,
  FlatList,
} from 'react-native';
import { Image } from 'expo-image';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useTheme } from '../../design-system/ThemeProvider';
import { useCityStore } from '../../store/cityStore';
import { cityList, cityThemes } from '../../design-system/themes';
import { spacing, borderRadius, insets } from '../../design-system/tokens/spacing';
import { fontSizes, fontWeights, letterSpacings, lineHeights } from '../../design-system/tokens/typography';
import type { Aura } from '../../store/cityStore';

const { width: SCREEN_W, height: SCREEN_H } = Dimensions.get('window');

const FILTER_TABS: { label: string; aura: Aura }[] = [
  { label: 'ALL', aura: 'all' },
  { label: 'VIP TABLES', aura: 'vip' },
  { label: 'ROOFTOPS', aura: 'rooftop' },
  { label: 'LIVE MUSIC', aura: 'live-music' },
  { label: 'AFTER HOURS', aura: 'after-hours' },
];

interface Venue {
  id: string;
  name: string;
  image: string;
  matchPct: number;
  vibeTags: string[];
  hours: string;
  peakTime: string;
  priceTier: '$' | '$$' | '$$$' | '$$$$';
  saved: boolean;
}

const MOCK_VENUES: Venue[] = [
  {
    id: '1',
    name: 'Cipriani Club',
    image: 'https://images.unsplash.com/photo-1566417713940-fe7c737a9ef2?w=800&auto=format',
    matchPct: 97,
    vibeTags: ['Upscale', 'Late Night'],
    hours: '9PM – 4AM',
    peakTime: '12AM',
    priceTier: '$$$$',
    saved: false,
  },
  {
    id: '2',
    name: 'The Monarch',
    image: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=800&auto=format',
    matchPct: 92,
    vibeTags: ['Rooftop', 'Cocktails'],
    hours: '8PM – 3AM',
    peakTime: '11PM',
    priceTier: '$$$',
    saved: true,
  },
  {
    id: '3',
    name: 'Studio 432',
    image: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&auto=format',
    matchPct: 88,
    vibeTags: ['Live Music', 'DJ'],
    hours: '10PM – 5AM',
    peakTime: '1AM',
    priceTier: '$$',
    saved: false,
  },
  {
    id: '4',
    name: 'Soho Terrace',
    image: 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?w=800&auto=format',
    matchPct: 84,
    vibeTags: ['After Hours', 'Minimal'],
    hours: '11PM – 6AM',
    peakTime: '2AM',
    priceTier: '$$$',
    saved: false,
  },
];

const HIGHLIGHT_IMAGES = [
  'https://images.unsplash.com/photo-1541532713592-79a0317b6b77?w=600&auto=format',
  'https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?w=600&auto=format',
  'https://images.unsplash.com/photo-1506157786151-b8491531f063?w=600&auto=format',
  'https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?w=600&auto=format',
];

function WaveBars({ color }: { color: string }) {
  const bars = [0.4, 0.7, 1.0, 0.6, 0.85, 0.5, 0.9, 0.65, 0.75, 0.45, 0.8, 0.55];
  return (
    <View style={waveStyles.container}>
      {bars.map((h, i) => (
        <View
          key={i}
          style={[
            waveStyles.bar,
            { height: 28 * h, backgroundColor: color, opacity: 0.6 + h * 0.4 },
          ]}
        />
      ))}
    </View>
  );
}

const waveStyles = StyleSheet.create({
  container: { flexDirection: 'row', alignItems: 'flex-end', gap: 3, height: 32 },
  bar: { width: 4, borderRadius: 2 },
});

function VenueCard({
  venue, primary, textPrimary, textSecondary, surface,
}: {
  venue: Venue; primary: string; textPrimary: string; textSecondary: string; surface: string;
}) {
  const [saved, setSaved] = useState(venue.saved);

  return (
    <View style={[cardStyles.card, { backgroundColor: surface, borderColor: `${primary}22` }]}>
      <View style={cardStyles.imageWrap}>
        <Image source={{ uri: venue.image }} style={cardStyles.image} contentFit="cover" transition={300} />
        <View style={[cardStyles.matchBadge, { backgroundColor: primary }]}>
          <Text style={cardStyles.matchText}>{venue.matchPct}%</Text>
        </View>
        <TouchableOpacity
          style={cardStyles.bookmarkBtn}
          onPress={() => setSaved((v) => !v)}
          hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
        >
          <Text style={[cardStyles.bookmarkIcon, { color: saved ? primary : 'rgba(255,255,255,0.5)' }]}>
            {saved ? '♥' : '♡'}
          </Text>
        </TouchableOpacity>
      </View>
      <View style={cardStyles.info}>
        <Text style={[cardStyles.venueName, { color: textPrimary }]} numberOfLines={1}>{venue.name}</Text>
        <View style={cardStyles.tagsRow}>
          {venue.vibeTags.map((tag) => (
            <View key={tag} style={[cardStyles.tag, { borderColor: `${primary}55` }]}>
              <Text style={[cardStyles.tagText, { color: primary }]}>{tag}</Text>
            </View>
          ))}
        </View>
        <View style={cardStyles.metaRow}>
          <Text style={[cardStyles.meta, { color: textSecondary }]}>{venue.hours}</Text>
          <View style={cardStyles.dot} />
          <Text style={[cardStyles.meta, { color: textSecondary }]}>Peak {venue.peakTime}</Text>
          <View style={cardStyles.dot} />
          <Text style={[cardStyles.meta, { color: primary }]}>{venue.priceTier}</Text>
        </View>
      </View>
    </View>
  );
}

const cardStyles = StyleSheet.create({
  card: { borderRadius: borderRadius['2xl'], borderWidth: 1, overflow: 'hidden', marginBottom: spacing[4] },
  imageWrap: { position: 'relative', height: 180 },
  image: { width: '100%', height: '100%' },
  matchBadge: {
    position: 'absolute', top: 12, left: 12,
    paddingHorizontal: 10, paddingVertical: 4, borderRadius: borderRadius.full,
  },
  matchText: { fontSize: fontSizes.sm, fontWeight: fontWeights.bold, color: '#000', letterSpacing: letterSpacings.wide },
  bookmarkBtn: { position: 'absolute', top: 10, right: 12 },
  bookmarkIcon: { fontSize: 22 },
  info: { padding: spacing[4], gap: spacing[2] },
  venueName: { fontSize: fontSizes.lg, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.tight },
  tagsRow: { flexDirection: 'row', gap: spacing[2], flexWrap: 'wrap' },
  tag: { borderWidth: 1, borderRadius: borderRadius.full, paddingHorizontal: spacing[3], paddingVertical: 3 },
  tagText: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wide },
  metaRow: { flexDirection: 'row', alignItems: 'center', gap: spacing[2], marginTop: 2 },
  meta: { fontSize: fontSizes.sm, fontWeight: fontWeights.medium },
  dot: { width: 3, height: 3, borderRadius: 2, backgroundColor: 'rgba(255,255,255,0.2)' },
});

function CitySelectorModal({ visible, onClose }: { visible: boolean; onClose: () => void }) {
  const { setCity, selectedCity } = useCityStore();

  return (
    <Modal visible={visible} transparent animationType="slide" onRequestClose={onClose}>
      <TouchableOpacity style={modalStyles.overlay} onPress={onClose} activeOpacity={1}>
        <View style={modalStyles.sheet}>
          <View style={modalStyles.handle} />
          <Text style={modalStyles.title}>SELECT CITY</Text>
          <FlatList
            data={cityList}
            keyExtractor={(item) => item.code}
            renderItem={({ item }) => {
              const cityTheme = cityThemes[item.code];
              const active = selectedCity === item.code;
              return (
                <TouchableOpacity
                  style={[modalStyles.cityRow, active && { backgroundColor: `${cityTheme.primary}18` }]}
                  onPress={() => { setCity(item.code); onClose(); }}
                >
                  <View style={[modalStyles.cityDot, { backgroundColor: cityTheme.primary }]} />
                  <Text style={[modalStyles.cityName, active && { color: cityTheme.primary }]}>{item.name}</Text>
                  {active && <Text style={[modalStyles.check, { color: cityTheme.primary }]}>✓</Text>}
                </TouchableOpacity>
              );
            }}
          />
        </View>
      </TouchableOpacity>
    </Modal>
  );
}

const modalStyles = StyleSheet.create({
  overlay: { flex: 1, backgroundColor: 'rgba(0,0,0,0.75)', justifyContent: 'flex-end' },
  sheet: {
    backgroundColor: '#0f0f0f',
    borderTopLeftRadius: borderRadius['3xl'], borderTopRightRadius: borderRadius['3xl'],
    paddingTop: spacing[4], paddingBottom: spacing[10],
    borderTopWidth: 1, borderTopColor: 'rgba(255,255,255,0.08)',
    maxHeight: SCREEN_H * 0.65,
  },
  handle: {
    width: 40, height: 4, borderRadius: 2,
    backgroundColor: 'rgba(255,255,255,0.15)', alignSelf: 'center', marginBottom: spacing[5],
  },
  title: {
    fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.ultraWide,
    color: 'rgba(255,255,255,0.4)', textAlign: 'center', marginBottom: spacing[4],
  },
  cityRow: {
    flexDirection: 'row', alignItems: 'center',
    paddingHorizontal: insets.screenHorizontal, paddingVertical: spacing[4],
    gap: spacing[4], borderRadius: borderRadius.lg,
    marginHorizontal: spacing[3], marginBottom: 2,
  },
  cityDot: { width: 8, height: 8, borderRadius: 4 },
  cityName: {
    flex: 1, fontSize: fontSizes.md, fontWeight: fontWeights.medium,
    color: 'rgba(255,255,255,0.75)', letterSpacing: letterSpacings.wide,
  },
  check: { fontSize: fontSizes.md, fontWeight: fontWeights.bold },
});

export default function RadarScreen() {
  const theme = useTheme();
  const insetsSafe = useSafeAreaInsets();
  const { selectedAura, setAura, selectedCity } = useCityStore();
  const [cityModalOpen, setCityModalOpen] = useState(false);
  const scrollY = useRef(new Animated.Value(0)).current;

  const headerOpacity = scrollY.interpolate({
    inputRange: [0, 120], outputRange: [0, 1], extrapolate: 'clamp',
  });

  const cityName = cityList.find((c) => c.code === selectedCity)?.name ?? 'New York';

  return (
    <View style={[styles.root, { backgroundColor: theme.background }]}>
      <Animated.View
        style={[
          styles.stickyHeader,
          { paddingTop: insetsSafe.top, backgroundColor: theme.background, borderBottomColor: theme.surface, opacity: headerOpacity },
        ]}
        pointerEvents="none"
      >
        <Text style={[styles.stickyLogo, { color: theme.primary }]}>WTW</Text>
      </Animated.View>

      <Animated.ScrollView
        style={styles.scroll}
        showsVerticalScrollIndicator={false}
        onScroll={Animated.event([{ nativeEvent: { contentOffset: { y: scrollY } } }], { useNativeDriver: true })}
        scrollEventThrottle={16}
      >
        {/* Hero */}
        <View style={[styles.hero, { paddingTop: insetsSafe.top + spacing[4] }]}>
          <View style={[styles.heroGradientOverlay, { backgroundColor: theme.background }]} />
          <View style={[styles.heroColorBleed, { backgroundColor: theme.primary, opacity: 0.06 }]} />

          <View style={styles.topBar}>
            <Text style={[styles.logo, { color: theme.primary }]}>WTW</Text>
            <TouchableOpacity
              style={[styles.citySelector, { borderColor: `${theme.primary}44` }]}
              onPress={() => setCityModalOpen(true)}
              activeOpacity={0.75}
            >
              <View style={[styles.citySelectorDot, { backgroundColor: theme.primary }]} />
              <Text style={[styles.citySelectorText, { color: theme.text.primary }]}>{cityName.toUpperCase()}</Text>
              <Text style={[styles.citySelectorChevron, { color: theme.primary }]}>›</Text>
            </TouchableOpacity>
          </View>

          <View style={styles.headlineBlock}>
            <Text style={[styles.headline, { color: theme.text.primary }]}>
              The night is{'\n'}already moving.
            </Text>
            <Text style={[styles.tagline, { color: theme.primary }]}>{theme.tagline}</Text>
          </View>

          <View style={[styles.glowOrb, { backgroundColor: theme.primary, opacity: 0.12 }]} />
        </View>

        {/* Filter Tabs */}
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          style={styles.filterScroll}
          contentContainerStyle={styles.filterContent}
        >
          {FILTER_TABS.map((tab) => {
            const active = selectedAura === tab.aura;
            return (
              <TouchableOpacity
                key={tab.aura}
                style={[
                  styles.filterTab,
                  active ? { backgroundColor: theme.primary } : { borderColor: `${theme.primary}35`, borderWidth: 1 },
                ]}
                onPress={() => setAura(tab.aura)}
                activeOpacity={0.8}
              >
                <Text style={[styles.filterTabText, { color: active ? theme.text.inverse : theme.text.secondary }]}>
                  {tab.label}
                </Text>
              </TouchableOpacity>
            );
          })}
        </ScrollView>

        <View style={styles.body}>
          {/* Live Signal Panel */}
          <View style={[styles.signalPanel, { backgroundColor: theme.surfaceElevated, borderColor: `${theme.primary}30` }]}>
            <View style={styles.signalHeader}>
              <View style={styles.signalLive}>
                <View style={[styles.liveDot, { backgroundColor: theme.waveColor }]} />
                <Text style={[styles.signalLabel, { color: theme.text.tertiary }]}>LIVE SIGNAL</Text>
              </View>
              <Text style={[styles.momentumPct, { color: theme.momentumColor }]}>87%</Text>
            </View>
            <Text style={[styles.momentumLabel, { color: theme.text.secondary }]}>Momentum in {cityName}</Text>
            <View style={styles.waveRow}>
              <WaveBars color={theme.waveColor} />
              <View style={styles.signalMeta}>
                <Text style={[styles.signalMetaText, { color: theme.text.tertiary }]}>142 venues active</Text>
                <Text style={[styles.signalMetaText, { color: theme.text.tertiary }]}>↑ 12% vs last Friday</Text>
              </View>
            </View>
          </View>

          {/* Curated Waves */}
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <Text style={[styles.sectionTitle, { color: theme.text.tertiary }]}>CURATED WAVES</Text>
              <TouchableOpacity>
                <Text style={[styles.sectionLink, { color: theme.primary }]}>See All</Text>
              </TouchableOpacity>
            </View>
            {MOCK_VENUES.map((venue) => (
              <VenueCard
                key={venue.id}
                venue={venue}
                primary={theme.primary}
                textPrimary={theme.text.primary}
                textSecondary={theme.text.secondary}
                surface={theme.surface}
              />
            ))}
          </View>

          {/* City Highlights */}
          <View style={styles.section}>
            <View style={styles.sectionHeader}>
              <Text style={[styles.sectionTitle, { color: theme.text.tertiary }]}>CITY HIGHLIGHTS</Text>
            </View>
            <View style={styles.highlightGrid}>
              {HIGHLIGHT_IMAGES.map((uri, i) => (
                <View
                  key={i}
                  style={[styles.highlightCell, i === 0 && styles.highlightCellLarge, { borderColor: `${theme.primary}20` }]}
                >
                  <Image source={{ uri }} style={styles.highlightImg} contentFit="cover" transition={300} />
                  <View style={styles.highlightOverlay} />
                </View>
              ))}
            </View>
          </View>

          <View style={{ height: spacing[12] }} />
        </View>
      </Animated.ScrollView>

      <CitySelectorModal visible={cityModalOpen} onClose={() => setCityModalOpen(false)} />
    </View>
  );
}

const GRID_CELL = (SCREEN_W - insets.screenHorizontal * 2 - spacing[2]) / 2;

const styles = StyleSheet.create({
  root: { flex: 1 },
  scroll: { flex: 1 },
  stickyHeader: {
    position: 'absolute', top: 0, left: 0, right: 0, zIndex: 100,
    paddingHorizontal: insets.screenHorizontal, paddingBottom: spacing[4],
    borderBottomWidth: 1, alignItems: 'center',
  },
  stickyLogo: { fontSize: fontSizes.base, fontWeight: fontWeights.black, letterSpacing: letterSpacings.ultraWide },
  hero: {
    minHeight: SCREEN_H * 0.50, paddingHorizontal: insets.screenHorizontal,
    paddingBottom: spacing[8], overflow: 'hidden', position: 'relative',
  },
  heroGradientOverlay: { ...StyleSheet.absoluteFillObject, opacity: 0.65 },
  heroColorBleed: { position: 'absolute', top: -80, right: -80, width: 300, height: 300, borderRadius: 150 },
  glowOrb: { position: 'absolute', bottom: -60, left: -40, width: 240, height: 240, borderRadius: 120 },
  topBar: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginBottom: spacing[8] },
  logo: { fontSize: fontSizes.base, fontWeight: fontWeights.black, letterSpacing: letterSpacings.ultraWide },
  citySelector: {
    flexDirection: 'row', alignItems: 'center', gap: spacing[2],
    borderWidth: 1, borderRadius: borderRadius.full,
    paddingHorizontal: spacing[4], paddingVertical: spacing[2],
  },
  citySelectorDot: { width: 6, height: 6, borderRadius: 3 },
  citySelectorText: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wider },
  citySelectorChevron: { fontSize: fontSizes.lg, lineHeight: fontSizes.lg, marginTop: -1 },
  headlineBlock: { marginTop: spacing[8], gap: spacing[3] },
  headline: {
    fontSize: fontSizes['3xl'], fontWeight: fontWeights.bold,
    lineHeight: fontSizes['3xl'] * lineHeights.tight, letterSpacing: letterSpacings.tightest,
  },
  tagline: {
    fontSize: fontSizes.base, fontStyle: 'italic', fontWeight: fontWeights.light,
    letterSpacing: letterSpacings.wide, lineHeight: fontSizes.base * lineHeights.relaxed, opacity: 0.9,
  },
  filterScroll: { marginTop: spacing[6] },
  filterContent: { paddingHorizontal: insets.screenHorizontal, gap: spacing[2], paddingBottom: spacing[2] },
  filterTab: { paddingHorizontal: spacing[5], paddingVertical: spacing[2] + 2, borderRadius: borderRadius.full },
  filterTabText: { fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.wider },
  body: { paddingHorizontal: insets.screenHorizontal, marginTop: spacing[6] },
  signalPanel: { borderRadius: borderRadius['2xl'], borderWidth: 1, padding: spacing[5], marginBottom: spacing[8], gap: spacing[3] },
  signalHeader: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between' },
  signalLive: { flexDirection: 'row', alignItems: 'center', gap: spacing[2] },
  liveDot: { width: 7, height: 7, borderRadius: 4 },
  signalLabel: { fontSize: fontSizes.xs, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.widest },
  momentumPct: { fontSize: fontSizes['2xl'], fontWeight: fontWeights.black, letterSpacing: letterSpacings.tightest },
  momentumLabel: { fontSize: fontSizes.sm, fontWeight: fontWeights.medium, letterSpacing: letterSpacings.wide },
  waveRow: { flexDirection: 'row', alignItems: 'flex-end', justifyContent: 'space-between', marginTop: spacing[2] },
  signalMeta: { alignItems: 'flex-end', gap: 3 },
  signalMetaText: { fontSize: fontSizes.xs, fontWeight: fontWeights.medium, letterSpacing: letterSpacings.wide },
  section: { marginBottom: spacing[8] },
  sectionHeader: { flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', marginBottom: spacing[4] },
  sectionTitle: { fontSize: fontSizes.xs, fontWeight: fontWeights.bold, letterSpacing: letterSpacings.ultraWide },
  sectionLink: { fontSize: fontSizes.sm, fontWeight: fontWeights.semibold, letterSpacing: letterSpacings.wide },
  highlightGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: spacing[2] },
  highlightCell: { width: GRID_CELL, height: GRID_CELL * 0.72, borderRadius: borderRadius.xl, overflow: 'hidden', borderWidth: 1 },
  highlightCellLarge: { width: '100%', height: GRID_CELL * 1.1 },
  highlightImg: { width: '100%', height: '100%' },
  highlightOverlay: { ...StyleSheet.absoluteFillObject, backgroundColor: 'rgba(0,0,0,0.25)' },
});
