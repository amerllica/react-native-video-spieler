import { NativeModules } from 'react-native';

type VideoSpielerType = {
  multiply(a: number, b: number): Promise<number>;
};

const { VideoSpieler } = NativeModules;

export default VideoSpieler as VideoSpielerType;
