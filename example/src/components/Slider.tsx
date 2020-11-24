import * as React from 'react';
import RNSlider from '@react-native-community/slider';
import noOp from '../utils/noOp';
import { colors } from '../helpers/theme';
import type { ViewStyleType } from '../types';

interface SliderProps {
  style?: ViewStyleType;
  value?: number;
  onSlidingStart?: (num: number) => void;
  onSlidingComplete?: (num: number) => void;
  minimumValue?: number;
  maximumValue?: number;
}

const Slider: React.FC<SliderProps> = ({
  style,
  value,
  onSlidingStart = noOp,
  onSlidingComplete = noOp,
  minimumValue = 0,
  maximumValue = 1,
}) => (
  <RNSlider
    style={style}
    value={value}
    minimumValue={minimumValue}
    maximumValue={maximumValue}
    minimumTrackTintColor={colors.primary}
    maximumTrackTintColor={colors.white}
    thumbTintColor={colors.primary}
    onSlidingStart={onSlidingStart}
    onSlidingComplete={onSlidingComplete}
  />
);

export default Slider;
