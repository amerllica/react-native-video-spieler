import React, { Component, createRef } from 'react';
import { requireNativeComponent } from 'react-native';
import { COMPONENT_NAME } from 'src/helper';
import noOp from 'src/utils/noOp';
import callNativeMethod from 'src/utils/callNativeMethod';
import type {
  NativeEventType,
  RefInstance,
  IrPlayerMediaInfo,
  IrPlayerMethodsType,
} from 'src/types';

export interface IrPlayerProps {
  src: string;
  height: number;
  width: number;
  onStopped?: Function;
  onPlaying?: Function;
  onPaused?: Function;
  onEnded?: Function;
  onOpening?: Function;
  onBuffering?: Function;
  onEsAdded?: Function;
  onTimeChanged?: Function;
}

const RCTIrPlayerView = requireNativeComponent<IrPlayerProps>(COMPONENT_NAME);

class IrPlayer extends Component<IrPlayerProps> {
  private readonly irPlayerInstance: RefInstance;

  constructor(props: IrPlayerProps) {
    super(props);

    this.irPlayerInstance = createRef();
  }

  public play = () => {
    callNativeMethod(this.irPlayerInstance.current, 'play');
  };

  public pause = () => {
    callNativeMethod(this.irPlayerInstance.current, 'pause');
  };

  public stop = () => {
    callNativeMethod(this.irPlayerInstance.current, 'stop');
  };

  public togglePlay = () => {
    callNativeMethod(this.irPlayerInstance.current, 'togglePlay');
  };

  public setMediaTime = (time: number) => {
    callNativeMethod(this.irPlayerInstance.current, 'setMediaTime', time);
  };

  private _onPlaying = (v: NativeEventType) => {
    console.log('Play----->', v.nativeEvent);
  };

  private _onStopped = (v: NativeEventType) => {
    console.log('Stopped----->', v.nativeEvent);
  };

  private _onPaused = (v: NativeEventType) => {
    console.log('Paused----->', v.nativeEvent);
  };

  private _onEsAdded = (v: NativeEventType) => {
    const { onEsAdded = noOp } = this.props;
    console.log('on es added----->', v.nativeEvent);

    onEsAdded({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  private _onBuffering = (v: NativeEventType) => {
    const { onBuffering = noOp } = this.props;
    console.log('onBuffering----->', v.nativeEvent);

    onBuffering({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  private _onTimeChanged = (v: NativeEventType) => {
    const { onTimeChanged = noOp } = this.props;
    console.log('onTimeChanged----->', v.nativeEvent);

    onTimeChanged({
      mediaLength: v.nativeEvent.mediaLength,
    });
  };

  private _onEnded = (v: NativeEventType) => {
    console.log('onEnded----->', v.nativeEvent);
  };

  private _onOpening = (v: NativeEventType) => {
    console.log('onOpening----->', v.nativeEvent);
  };

  render() {
    const { src, height, width } = this.props;

    return (
      <RCTIrPlayerView
        ref={this.irPlayerInstance}
        src={src}
        height={height}
        width={width}
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

export { IrPlayerMediaInfo, IrPlayerMethodsType };

export default IrPlayer;
