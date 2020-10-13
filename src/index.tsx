import * as React from 'react';
import { requireNativeComponent } from 'react-native';

const IrPlayerView = requireNativeComponent('RCTIrPlayer');

export default class IrPlayer extends React.PureComponent {
  render() {
    return <IrPlayerView />;
  }
}
