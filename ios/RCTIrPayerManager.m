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
RCT_EXTERN_METHOD(setMediaTime:(nonnull NSNumber *)node time:(nonnull NSNumber *)time)

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
