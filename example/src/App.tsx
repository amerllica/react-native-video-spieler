import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import RCTIrPlayerView from 'react-native-ir-player';

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.videoWrapper}>
        <RCTIrPlayerView color={"#704159FF"} playerWidth={400} playerHeight={300} src={"http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4"}/>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    borderWidth: 2,
    borderColor: 'red',
    flex: 1,
    paddingTop: 80,
  },
  videoWrapper: {
    borderWidth: 10,
    borderColor: '#0a0',
  },
  text: {
    color: 'blue',
    fontSize: 30,
  }
});
