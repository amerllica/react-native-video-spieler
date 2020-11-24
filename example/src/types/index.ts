import type { StyleProp, ViewStyle } from 'react-native';
import type {
  IrPlayerMethodsType,
  IrPlayerMediaInfo,
} from 'react-native-ir-player';
// @ts-ignore
import type { MaterialIconsGlyphs } from 'react-native-vector-icons/MaterialIcons.js.flow';

export { IrPlayerMethodsType, IrPlayerMediaInfo };

export type ViewStyleType = StyleProp<ViewStyle>;

export type VoidFunction = (...args: any[]) => void;

export type IconNamesType = MaterialIconsGlyphs;
