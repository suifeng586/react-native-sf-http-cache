//
//  HttpCache.m
//  JianKeBao
//
//  Created by SmartFun on 2017/8/31.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "SFHttpCache.h"

@implementation SFHttpCache


RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getHttpCacheSize:(RCTResponseSenderBlock)callback)
{
  NSURLCache *httpCache = [NSURLCache sharedURLCache];
  NSNumber *aNumber = [NSNumber numberWithInteger:[httpCache currentDiskUsage]];
  callback(@[[NSNull null], aNumber]);
}

RCT_EXPORT_METHOD(clearCache:(RCTResponseSenderBlock)callback)
{
  NSURLCache *httpCache = [NSURLCache sharedURLCache];
  [httpCache removeAllCachedResponses];
  NSNumber *aNumber = [NSNumber numberWithInteger:[httpCache currentDiskUsage]];
  callback(@[[NSNull null], aNumber]);
}




@end
