import { Tabs } from 'expo-router';
import { useTheme } from '../../design-system/ThemeProvider';

export default function TabsLayout() {
  const theme = useTheme();
  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarStyle: {
          backgroundColor: theme.background,
          borderTopColor: 'rgba(255,255,255,0.06)',
          borderTopWidth: 1,
          height: 60,
          paddingBottom: 8,
        },
        tabBarActiveTintColor: theme.primary,
        tabBarInactiveTintColor: 'rgba(255,255,255,0.35)',
        tabBarLabelStyle: {
          fontSize: 10,
          fontWeight: '600',
          letterSpacing: 2,
        },
      }}
    >
      <Tabs.Screen name="index" options={{ title: 'RADAR' }} />
      <Tabs.Screen name="explore" options={{ title: 'EXPLORE' }} />
      <Tabs.Screen name="saved" options={{ title: 'SAVED' }} />
      <Tabs.Screen name="profile" options={{ title: 'PROFILE' }} />
    </Tabs>
  );
}
