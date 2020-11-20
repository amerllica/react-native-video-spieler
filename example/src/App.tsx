import * as React from 'react';
import { StyleSheet, View, Slider } from 'react-native';
import RCTIrPlayerView, {
  MediaInfo,
  IrPlayerMethodsType,
} from 'react-native-ir-player';

const App = () => {
  const thePlayer = React.useRef<IrPlayerMethodsType>(null);
  const [mediaLength, setMediaLength] = React.useState(0);

  return (
    <View style={styles.container}>
      <View style={styles.videoWrapper}>
        <Slider
          maximumValue={mediaLength}
          minimumValue={0}
          onSlidingComplete={(value) => {
            thePlayer.current?.setMediaTime(value);
          }}
        />
        <RCTIrPlayerView
          onEsAdded={({ mediaLength: ml }: MediaInfo) => {
            console.log('=======>> inside on es added: ', ml);
            setMediaLength(ml);
          }}
          onBuffering={({ mediaLength: ml }: MediaInfo) => {
            console.log('=======>> inside on buffering: ', ml);
            setMediaLength(ml);
          }}
          onTimeChanged={({ mediaLength: ml }: MediaInfo) => {
            console.log('=======>> inside on time changed: ', ml);
          }}
          // @ts-ignore
          ref={thePlayer}
          width={200}
          height={100}
          src="http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4"
        />
      </View>
    </View>
  );
};

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
    backgroundColor: '#FFF',
  },
});

export default App;
