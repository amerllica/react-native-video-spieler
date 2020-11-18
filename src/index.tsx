import React, { Component, createRef } from 'react';
import {
  requireNativeComponent,
  findNodeHandle,
  UIManager,
} from 'react-native';
const COMPONENT_NAME = 'RCTIrPlayer';
const RCTIrPlayerView = requireNativeComponent(COMPONENT_NAME);

export default class RCTIrPlayer extends Component {
  constructor(props) {
    super(props);
    this.irplayerInstance = createRef();
  }

  play = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.irplayerInstance.current),
      UIManager[COMPONENT_NAME].Commands.playFromManager,
      []
    );
  };

  render() {
    return <RCTIrPlayerView ref={this.irplayerInstance} {...this.props} />;
  }

}
