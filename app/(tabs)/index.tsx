import { View, Image, StyleSheet, Dimensions } from 'react-native';

const { width } = Dimensions.get('window');

export default function RadarScreen() {
  return (
    <View style={styles.container}>
      <Image
        source={require('../../assets/wtw-logo.png')}
        style={styles.logo}
        resizeMode="contain"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#000000',
  },
  logo: {
    width: width * 0.75,
    height: width * 0.5,
  },
});
