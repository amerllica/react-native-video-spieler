import * as React from 'react';
import VectorIcon from 'react-native-vector-icons/MaterialIcons';
import { colors, sizes } from '../helpers/theme';
import type { ViewStyleType, IconNamesType } from '../types';

interface IconProps {
  style?: ViewStyleType;
  name: IconNamesType;
  color?: string;
  size?: number;
}

const Icon: React.FC<IconProps> = ({
  style,
  name,
  color = colors.white,
  size = sizes.icon,
}) => <VectorIcon style={style} name={name} color={color} size={size} />;

export default Icon;
