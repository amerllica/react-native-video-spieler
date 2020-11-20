import type { BaseSyntheticEvent, RefObject } from 'react';

export type MediaInfo = {
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
};

export type NativeEventType = BaseSyntheticEvent<MediaInfo>;

export type RefInstance = RefObject<any>;
