import type { BaseSyntheticEvent, RefObject } from 'react';

export type MediaInfo = {
  target: number;
  mediaLength: number;
  time: number;
};

export type NativeEventType = BaseSyntheticEvent<MediaInfo>;

export type RefInstance = RefObject<any>;
