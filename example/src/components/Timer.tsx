import * as React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import styleJoiner from '../utils/styleJoiner';
import toMinuteSecond from '../utils/toMinuteSecond';
import { colors, grids } from '../helpers/theme';
import type { ViewStyleType } from '../types';

interface TimerProps {
  style?: ViewStyleType;
  duration: number;
  currentTime: number;
}

const Timer: React.FC<TimerProps> = ({ style, duration, currentTime }) => (
  <View style={styleJoiner(styles.root, style)}>
    <Text style={styles.currentTime}>{toMinuteSecond(currentTime)}</Text>
    <Text style={styles.separator}>/</Text>
    <Text style={styles.duration}>{toMinuteSecond(duration)}</Text>
  </View>
);

const styles = StyleSheet.create({
  root: {
    flexDirection: 'row',
  },
  currentTime: {
    color: colors.white,
    fontWeight: 'bold',
    width: 45,
  },
  separator: {
    color: colors.gray,
    marginHorizontal: grids.unit / 2,
  },
  duration: {
    color: colors.gray,
  },
});

export default Timer;
