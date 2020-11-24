import * as React from 'react';
import { View, StyleSheet } from 'react-native';
import styleJoiner from '../utils/styleJoiner';
import Icon from './Icon';
import Slider from './Slider';
import { grids } from '../helpers/theme';
import type { ViewStyleType } from '../types';

interface VolumeProps {
  style?: ViewStyleType;
  minimumValue?: number;
  maximumValue?: number;
}

const Volume: React.FC<VolumeProps> = ({
  style,
  minimumValue = 0,
  maximumValue = 1,
}) => {
  const [vol, setVol] = React.useState(0);

  return (
    <View style={styleJoiner(styles.root, style)}>
      <Icon name="volume-up" style={styles.volumeIcon} size={20} />
      <Slider
        minimumValue={minimumValue}
        maximumValue={maximumValue}
        style={styles.slider}
        value={vol}
        onSlidingComplete={(v: number) => {
          setVol(v);
          console.log('the change of volume: ', v);
        }}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  root: {
    flexDirection: 'row-reverse',
    alignItems: 'center',
  },
  volumeIcon: {
    marginHorizontal: grids.unit,
  },
  slider: {
    width: 100,
  },
});

export default Volume;
