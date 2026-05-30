import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../design-system/ThemeProvider';
export default function ProfileScreen() {
  const theme = useTheme();
  return (
    <View style={[styles.c, { backgroundColor: theme.background }]}>
      <Text style={[styles.t, { color: theme.text.secondary }]}>PROFILE</Text>
    </View>
  );
}
const styles = StyleSheet.create({
  c: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  t: { fontSize: 14, letterSpacing: 4 },
});
