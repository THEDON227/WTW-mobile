import { Tabs } from 'expo-router';
import { useTheme } from '../../design-system/ThemeProvider';
import { Text, View, StyleSheet } from 'react-native';
import { letterSpacings, fontSizes, fontWeights } from '../../design-system/tokens/typography';

function TabIcon({ label, focused, color }: { label: string; focused: boolean; color: string }) {
  return (
    <View style={styles.tabItem}>
      <Text style={[
        styles.tabLabel,
        { color: focused ? color : 'rgba(255,255,255,0.35)' },
        focused && styles.tabLabelActive,
      ]}>
        {label}
      </Text>
      {focused && <View style={[styles.tabDot, { backgroundColor: color }]} />}
    </View>
  );
}

export default function TabsLayout() {
  const theme = useTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarStyle: {
          backgroundColor: theme.background,
          borderTopColor: theme.surface,
          borderTopWidth: 1,
          height: 72,
          paddingBottom: 12,
          paddingTop: 10,
        },
        tabBarShowLabel: false,
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="RADAR" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="explore"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="EXPLORE" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="saved"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="SAVED" focused={focused} color={theme.primary} />
          ),
        }}
      />
      <Tabs.Screen
        name="profile"
        options={{
          tabBarIcon: ({ focused, color }) => (
            <TabIcon label="PROFILE" focused={focused} color={theme.primary} />
          ),
        }}
      />
    </Tabs>
  );
}

const styles = StyleSheet.create({
  tabItem: {
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
    minWidth: 60,
  },
  tabLabel: {
    fontSize: fontSizes.xs,
    fontWeight: fontWeights.semibold,
    letterSpacing: letterSpacings.wider,
  },
  tabLabelActive: {
    fontWeight: fontWeights.bold,
  },
  tabDot: {
    width: 3,
    height: 3,
    borderRadius: 2,
    marginTop: 2,
  },
});
