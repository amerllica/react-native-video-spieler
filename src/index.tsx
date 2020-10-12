import * as React from 'react';
import { requireNativeComponent, NativeModules } from 'react-native';

const IrPlayerView = requireNativeComponent('RCTIrPlayer');

export default class IrPlayer extends React.PureComponent {
  render() {
    return <IrPlayerView />
  }
}
