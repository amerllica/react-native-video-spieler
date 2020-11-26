#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import "React/RCTEventEmitter.h"
#import "React/RCTUIManager.h"
#import <React/RCTLog.h>

@interface RCT_EXTERN_MODULE(RCTIrPlayerManager, RCTViewManager)


#pragma mark Extern-Methods
RCT_EXTERN_METHOD(play:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(pause:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(togglePlay:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(stop:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(volumeUp:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(volumeDown:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(jumpForward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(jumpBackward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(longJumpForward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(longJumpBackward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(shortJumpForward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(shortJumpBackward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(mediumJumpForward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(mediumJumpBackward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(extraShortJumpForward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(extraShortJumpBackward:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(getMediaInfo:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(rewind:(nonnull NSNumber *)node)
RCT_EXTERN_METHOD(fastForward:(nonnull NSNumber *)node)


#pragma mark Extern-Methods-With-Parameters
RCT_EXTERN_METHOD(setMediaTime:(nonnull NSNumber *)node time:(nonnull NSNumber *)time)
RCT_EXTERN_METHOD(setVolume:(nonnull NSNumber *)node volume:(nonnull NSNumber *)volume)
RCT_EXTERN_METHOD(addPlaybackSubtitle:(nonnull NSNumber *)node subTitleSrc:(nonnull NSString *)subTitleSrc)
RCT_EXTERN_METHOD(addPlaybackAudio:(nonnull NSNumber *)node subTitleSrc:(nonnull NSString *)audioSrc)
RCT_EXTERN_METHOD(setCurrentVideoSubTitleIndex:(nonnull NSNumber *)node index:(nonnull NSNumber *)index)


#pragma mark Extern-Methods-With-Callback


#pragma mark Properties
RCT_EXPORT_VIEW_PROPERTY(src, NSString);
RCT_EXPORT_VIEW_PROPERTY(width, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(height, NSNumber)

#pragma mark Properties-With-CallBack
RCT_EXPORT_VIEW_PROPERTY(onStopped, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onBuffering, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onEnded, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onError, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onEsAdded, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onOpening, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPaused, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onPlaying, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onStateChange, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onTimeChange, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onGetMediaInfo, RCTDirectEventBlock)

#pragma mark Custom-Properties



















//RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
//{
//    [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
//}


//    RCT_EXPORT_VIEW_PROPERTY(onPlay, RCTBubblingEventBlock)
//    RCT_EXPORT_VIEW_PROPERTY(onPause, RCTDirectEventBlock)
//    RCT_EXPORT_VIEW_PROPERTY(onPlay, RCTDirectEventBlock)

//RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)

//RCT_EXTERN_METHOD(
//  decrement: (RCTPromiseResolveBlock)resolve
//  rejecter: (RCTPromiseRejectBlock)reject
//)

//_RCT_EXTERN_REMAP_METHOD(inc, increment, false)


//@interface RCT_EXTERN_MODULE(Counter, RCTEventEmitter)

@end
