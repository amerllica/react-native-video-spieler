import * as React from 'react';
import { TouchableOpacity, StyleSheet } from 'react-native';
import styleJoiner from '../utils/styleJoiner';
import Volume from './Volume';
import { sizes } from '../helpers/theme';
import type { ViewStyleType } from '../types';

interface ConfigProps {
  style?: ViewStyleType;
}

const Config: React.FC<ConfigProps> = ({ style }) => (
  <TouchableOpacity activeOpacity={1} style={styleJoiner(styles.root, style)}>
    <Volume />
  </TouchableOpacity>
);

const styles = StyleSheet.create({
  root: {
    flexDirection: 'row-reverse',
    height: sizes.iconButton,
    alignItems: 'center',
    justifyContent: 'space-between',
  },
});

export default Config;
