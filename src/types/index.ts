import type { BaseSyntheticEvent, RefObject } from 'react';

export type IrPlayerMediaInfo = {
  target: number;
  mediaLength: number;
  time: number;
};

export type IrPlayerMethodsType = {
  play: () => void;
  pause: () => void;
  stop: () => void;
  togglePlay: () => void;
  setMediaTime: (time: number) => void;
  volumeUp: () => void;
  volumeDown: () => void;
  jumpForward: () => void;
  jumpBackward: () => void;
  longJumpForward: () => void;
  longJumpBackward: () => void;
  shortJumpForward: () => void;
  shortJumpBackward: () => void;
  mediumJumpForward: () => void;
  mediumJumpBackward: () => void;
  extraShortJumpForward: () => void;
  extraShortJumpBackward: () => void;
  rewind: () => void;
  fastForward: () => void;
  addPlaybackSlaveSubtitle: (src: string) => void;
  addPlaybackSlaveAudio: (src: string) => void;
  setVolume: (value: number) => void;
  setCurrentVideoSubTitleIndex: (time: number) => void;
};

export type NativeEventType = BaseSyntheticEvent<IrPlayerMediaInfo>;

export type RefInstance = RefObject<any>;
