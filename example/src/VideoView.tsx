import * as React from 'react';
import {
  StyleSheet,
  View,
  SafeAreaView,
  TouchableOpacity,
  StatusBar,
} from 'react-native';
import IrPlayer from 'react-native-ir-player';
import Controllers from './components/Controllers';
import styleJoiner from './utils/styleJoiner';
import getDimensions from './utils/getDimensions';
import orientation from './utils/orientation';
import type { IrPlayerMethodsType, IrPlayerMediaInfo } from './types';

interface VideoViewProps {
  [key: string]: any;
}

interface VideoViewStates {
  duration: number;
  currentTime: number;
  paused: boolean;
  fullscreen: boolean;
  showControllers: boolean;
  videoDim: {
    width: number;
    height: number;
  };
}

class VideoView extends React.Component<VideoViewProps, VideoViewStates> {
  private readonly initialVideoDim: { width: number; height: number };
  private readonly fullscreenVideoDim: { width: number; height: number };
  private readonly videoRef: React.RefObject<IrPlayerMethodsType>;

  constructor(props: VideoViewProps) {
    super(props);

    const initialVideoDim = {
      height: getDimensions().width * (9 / 16),
      width: getDimensions().width,
    };

    this.state = {
      duration: Number.MAX_SAFE_INTEGER,
      currentTime: 0,
      paused: false,
      fullscreen: false,
      showControllers: false,
      videoDim: initialVideoDim,
    };

    this.initialVideoDim = initialVideoDim;
    this.fullscreenVideoDim = {
      height: getDimensions().width,
      width: getDimensions().height,
    };
    this.videoRef = React.createRef<IrPlayerMethodsType>();
  }

  componentDidMount() {
    orientation.lockToPortrait();
  }

  componentWillUnmount() {
    orientation.lockToPortrait();
    StatusBar.setHidden(false);
  }

  toggleShowControllers = () =>
    this.setState(({ showControllers }) => ({
      showControllers: !showControllers,
    }));

  togglePause = () => this.videoRef.current?.togglePlay();

  toggleFullscreen = () =>
    this.setState(
      ({ fullscreen }) => ({
        fullscreen: !fullscreen,
        videoDim: fullscreen ? this.initialVideoDim : this.fullscreenVideoDim,
      }),
      () => {
        const { fullscreen } = this.state;

        if (fullscreen) {
          StatusBar.setHidden(true);
          orientation.lockToLandscape();
        } else {
          StatusBar.setHidden(false);
          orientation.lockToPortrait();
        }
      }
    );

  handleCurrentPosition = (ml: number) => {
    const { showControllers } = this.state;

    showControllers &&
      this.setState({
        currentTime: ml,
      });
  };

  render() {
    const {
      showControllers,
      paused,
      duration,
      currentTime,
      fullscreen,
      videoDim,
    } = this.state;

    return (
      <SafeAreaView>
        <View style={styles.container}>
          <TouchableOpacity
            onPress={this.toggleShowControllers}
            style={styleJoiner(
              styles.videoWrapper,
              fullscreen && styles.fullscreen
            )}
          >
            {showControllers && (
              <Controllers
                paused={paused}
                togglePause={this.togglePause}
                duration={duration}
                currentTime={currentTime}
                // @ts-ignore
                videoRef={this.videoRef.current}
                toggleFullscreen={this.toggleFullscreen}
                fullscreen={fullscreen}
              />
            )}
            <IrPlayer
              onEsAdded={({ mediaLength: ml }: IrPlayerMediaInfo) => {
                console.log('=======>> inside on es added: ', ml);
                this.handleCurrentPosition(ml);
              }}
              onBuffering={({ mediaLength: ml }: IrPlayerMediaInfo) => {
                console.log('=======>> inside on buffering: ', ml);
                this.handleCurrentPosition(ml);
              }}
              onTimeChanged={({ mediaLength: ml }: IrPlayerMediaInfo) => {
                console.log('=======>> inside on time changed: ', ml);
              }}
              // @ts-ignore
              ref={this.videoRef}
              width={videoDim.width}
              height={videoDim.height}
              src="http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4"
            />
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  videoWrapper: {
    position: 'relative',
  },
  fullscreen: {
    position: 'absolute',
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    zIndex: 2,
  },
});

export default VideoView;
