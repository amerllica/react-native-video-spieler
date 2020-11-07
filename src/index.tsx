import * as React from 'react';
import { requireNativeComponent } from 'react-native';

const RCTIrPlayerView = requireNativeComponent('RCTIrPlayer');

export default class RCTIrPlayer extends React.PureComponent {
  componentDidMount() {
    // RCTIrPlayerView.play();
  }
  render() {
    return <RCTIrPlayerView {...this.props} />;
  }
}
