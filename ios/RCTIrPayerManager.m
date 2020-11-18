#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import "React/RCTEventEmitter.h"
#import "React/RCTUIManager.h"
#import <React/RCTLog.h>

@interface RCT_EXTERN_MODULE(RCTIrPlayerManager, RCTViewManager)

RCT_EXTERN_METHOD(playFromManager:(nonnull NSNumber *)node)
//    RCT_EXTERN_METHOD(pause)
RCT_EXPORT_VIEW_PROPERTY(color, NSString);
RCT_EXPORT_VIEW_PROPERTY(txt, NSString);
RCT_EXPORT_VIEW_PROPERTY(src, NSString);
RCT_EXPORT_VIEW_PROPERTY(width, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(height, NSNumber)

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
