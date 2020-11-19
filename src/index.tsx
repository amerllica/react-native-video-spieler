import React, { Component, createRef } from 'react';
import {
  requireNativeComponent,
  findNodeHandle,
  UIManager,
  NativeModules,
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
      UIManager[COMPONENT_NAME].Commands.play,
      []
    );
  };

  pause = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.irplayerInstance.current),
      UIManager[COMPONENT_NAME].Commands.pause,
      []
    );
    console.log(this.time());
  };

  stop = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.irplayerInstance.current),
      UIManager[COMPONENT_NAME].Commands.stop,
      []
    );
  };

  togglePlay = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.irplayerInstance.current),
      UIManager[COMPONENT_NAME].Commands.togglePlay,
      []
    );
  };

  time = async () => {
    try {
      const data = await NativeModules.RCTIrPlayer.getTime(
        findNodeHandle(this.irplayerInstance.current)
      );
      console.log('=> amer: ', data);
    } catch (e) {
      console.error('=> maziar: ',e);
    }
  };

  render() {
    return <RCTIrPlayerView ref={this.irplayerInstance} {...this.props} />;
  }

}
