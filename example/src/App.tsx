import * as React from 'react';
import { StyleSheet, View, Text, TouchableOpacity } from 'react-native';
import RCTIrPlayerView from 'react-native-ir-player';

export default function App() {
  const thePlayer = React.useRef(null);

  const playHandler = () => {
    thePlayer.current.play();
  };

  const pauseHandler = () => {
    thePlayer.current.pause();
  };

  const stopHandler = () => {
    thePlayer.current.stop();
  };

  const togglePlayHandler = () => {
    thePlayer.current.togglePlay();
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity
        style={{ padding: 15, backgroundColor: 'yellow' }}
        onPress={playHandler}
      >
        <Text>PLAY!</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={{ padding: 15, backgroundColor: 'brown' }}
        onPress={pauseHandler}
      >
        <Text>PAUSE!</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={{ padding: 15, backgroundColor: 'blue' }}
        onPress={stopHandler}
      >
        <Text>STOP!</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={{ padding: 15, backgroundColor: 'green' }}
        onPress={togglePlayHandler}
      >
        <Text>TOGGLE_PLAY!</Text>
      </TouchableOpacity>

      <View style={styles.videoWrapper}>
        <RCTIrPlayerView
          ref={thePlayer}
          width={200}
          height={100}
          src="http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4"
        />
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
  },
  button: {
    marginTop: 50,
    width: 120,
    height: 60,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: '#F0F',
    backgroundColor: "#FFF"
  }
});

