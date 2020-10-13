import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import IrPlayer from 'react-native-ir-player';

export default function App() {
  return (
    <View style={styles.container}>
      <IrPlayer />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
