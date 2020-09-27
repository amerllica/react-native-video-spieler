import { NativeModules } from 'react-native';

type IrPlayerType = {
  multiply(a: number, b: number): Promise<number>;
};

const { IrPlayer } = NativeModules;

export default IrPlayer as IrPlayerType;
