import { Dimensions } from 'react-native';

const getDimensions = () => ({
  width: Dimensions.get('window').width,
  height: Dimensions.get('window').height,
});

export default getDimensions;
