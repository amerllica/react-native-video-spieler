import React, { Component, createRef } from 'react';
import { requireNativeComponent } from 'react-native';
import { COMPONENT_NAME } from './helper';
import noOp from './utils/noOp';
import callNativeMethod from './utils/callNativeMethod';
import type {
  NativeEventType,
  RefInstance,
  IrPlayerMediaInfo as IPMI,
  IrPlayerMethodsType as IPMT,
} from './types';

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
  onGetMediaInfo?: Function;
}
export interface IrPlayerMediaInfo extends IPMI {}
export interface IrPlayerMethodsType extends IPMT {}

const RCTIrPlayerView = requireNativeComponent<IrPlayerProps>(COMPONENT_NAME);

class IrPlayer extends Component<IrPlayerProps> {
  private readonly irPlayerInstance: RefInstance;

  constructor(props: IrPlayerProps) {
    super(props);

    this.irPlayerInstance = createRef();
  }

  // Public Methods

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

  public getMediaInfo = () => {
    callNativeMethod(this.irPlayerInstance.current, 'getMediaInfo');
  };

  public volumeUp = () => {
    callNativeMethod(this.irPlayerInstance.current, 'volumeUp');
  };

  public volumeDown = () => {
    callNativeMethod(this.irPlayerInstance.current, 'volumeDown');
  };

  public jumpForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'jumpForward');
  };

  public jumpBackward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'jumpBackward');
  };

  public longJumpForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'longJumpForward');
  };

  public longJumpBackward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'longJumpBackward');
  };

  public shortJumpForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'shortJumpForward');
  };

  public shortJumpBackward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'shortJumpBackward');
  };

  public mediumJumpForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'mediumJumpForward');
  };

  public mediumJumpBackward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'mediumJumpBackward');
  };

  public extraShortJumpForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'extraShortJumpForward');
  };

  public extraShortJumpBackward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'extraShortJumpBackward');
  };

  public rewind = () => {
    callNativeMethod(this.irPlayerInstance.current, 'rewind');
  };

  public fastForward = () => {
    callNativeMethod(this.irPlayerInstance.current, 'fastForward');
  };

  public addPlaybackSlaveSubtitle = (src: string) => {
    callNativeMethod(
      this.irPlayerInstance.current,
      'addPlaybackSlaveSubtitle',
      src
    );
  };

  public addPlaybackSlaveAudio = (src: string) => {
    callNativeMethod(
      this.irPlayerInstance.current,
      'addPlaybackSlaveAudio',
      src
    );
  };

  public setVolume = (value: number) => {
    callNativeMethod(this.irPlayerInstance.current, 'setVolume', value);
  };

  public setCurrentVideoSubTitleIndex = (time: number) => {
    callNativeMethod(
      this.irPlayerInstance.current,
      'setCurrentVideoSubTitleIndex',
      time
    );
  };

  // Private Methods

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

  private _onGetMediaInfo = (v: NativeEventType) => {
    console.log('onGetMediaInfo----->', v.nativeEvent);
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
        onGetMediaInfo={this._onGetMediaInfo}
      />
    );
  }
}

export default IrPlayer;
