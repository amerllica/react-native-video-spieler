import * as React from 'react';
import Slider from './Slider';
import Icon from './Icon';
import { TouchableOpacity, View, StyleSheet } from 'react-native';
import styleJoiner from '../utils/styleJoiner';
import Timer from './Timer';
import Config from './Config';
import { colors, grids, sizes } from '../helpers/theme';
import type {
  ViewStyleType,
  IrPlayerMethodsType,
  VoidFunction,
} from '../types';

interface ControllersProps {
  style?: ViewStyleType;
  paused: boolean;
  togglePause: VoidFunction;
  toggleFullscreen: VoidFunction;
  fullscreen: boolean;
  duration: number;
  currentTime: number;
  videoRef: IrPlayerMethodsType;
}

const Controllers: React.FC<ControllersProps> = ({
  style,
  duration,
  currentTime,
  videoRef,
  paused,
  togglePause,
  toggleFullscreen,
  fullscreen,
}) => {
  const [sliderValueFromProp, setSliderValueFromProps] = React.useState(true);
  const [showConfig, setShowConfig] = React.useState(false);

  return (
    <View style={styleJoiner(styles.root, style)}>
      <TouchableOpacity
        onPress={() => setShowConfig((s) => !s)}
        style={styles.gear}
      >
        <Icon name="settings" size={22} />
      </TouchableOpacity>
      {showConfig && <Config style={styles.config} />}
      <TouchableOpacity onPress={toggleFullscreen} style={styles.fullscreen}>
        <Icon name={fullscreen ? 'fullscreen-exit' : 'fullscreen'} />
      </TouchableOpacity>
      <TouchableOpacity onPress={togglePause}>
        <Icon
          name={paused ? 'play-circle-outline' : 'pause-circle-outline'}
          size={60}
        />
      </TouchableOpacity>
      <Slider
        style={styles.slider}
        value={sliderValueFromProp ? currentTime / duration : undefined}
        onSlidingStart={() => setSliderValueFromProps(false)}
        onSlidingComplete={(time: number) => {
          setSliderValueFromProps(true);
          videoRef.setMediaTime(time);
        }}
      />
      <Timer
        duration={duration}
        currentTime={currentTime}
        style={styles.timer}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  root: {
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.blackGlass,
    position: 'absolute',
    top: 0,
    right: 0,
    bottom: 0,
    left: 0,
    zIndex: 2,
  },
  gear: {
    position: 'absolute',
    top: 0,
    right: 0,
    width: sizes.iconButton,
    height: sizes.iconButton,
    justifyContent: 'center',
    alignItems: 'center',
  },
  fullscreen: {
    position: 'absolute',
    bottom: 0,
    right: 0,
    width: sizes.iconButton,
    height: sizes.iconButton,
    justifyContent: 'center',
    alignItems: 'center',
  },
  slider: {
    position: 'absolute',
    right: sizes.iconButton,
    left: sizes.iconButton * 3,
    height: sizes.icon,
    bottom: grids.unit,
  },
  timer: {
    position: 'absolute',
    bottom: grids.unit + 4,
    left: grids.gutter,
  },
  config: {
    position: 'absolute',
    top: 0,
    right: sizes.iconButton,
    left: grids.gutter,
  },
});

export default Controllers;
