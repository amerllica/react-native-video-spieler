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
    this._props = props;
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

  seek = (time) => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.irplayerInstance.current),
      UIManager[COMPONENT_NAME].Commands.setMediaTime,
      [time]
    );
  };

  _onPlaying = (v) => {
    console.log('Play----->', v.nativeEvent);
  };

  _onStopped = (v) => {
    console.log('Stopped----->', v.nativeEvent);
  };

  _onPaused = (v) => {
    console.log('Paused----->', v.nativeEvent);
  };

  _onEsAdded = (v) => {
    const { onEsAdded } = this.props;
    console.log('on es added----->', v.nativeEvent);

    onEsAdded({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  _onBuffering = (v) => {
    const { onBuffering } = this.props;
    console.log('onBuffering----->', v.nativeEvent);

    onBuffering({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  _onTimeChanged = (v) => {
    const { onTimeChanged } = this.props;
    console.log('onTimeChanged----->', v.nativeEvent);

    onTimeChanged({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  _onEnded = (v) => {
    console.log('onEnded----->', v.nativeEvent);
  };

  _onOpening = (v) => {
    console.log('onOpening----->', v.nativeEvent);
  };


  render() {
    return (
      <RCTIrPlayerView
        ref={this.irplayerInstance}
        {...this.props}
        onStopped={this._onStopped}
        onPlaying={this._onPlaying}
        onPaused={this._onPaused}
        onEnded={this._onEnded}
        onOpening={this._onOpening}
        onBuffering={this._onBuffering}
        onEsAdded={this._onEsAdded}
        onTimeChanged={this._onTimeChanged}
      />
    );
  }

}
