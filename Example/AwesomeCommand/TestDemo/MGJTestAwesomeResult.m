//
//  MGJTestAwesomeResult.m
//  AwesomeCommand
//
//  Created by Senmiao on 16/8/15.
//  Copyright © 2016年 wentong. All rights reserved.
//

#import "MGJTestAwesomeResult.h"
@interface MGJTestAwesomeResult()
@property (nonatomic, strong) id<RACSubscriber> subscriber;
@end

@implementation MGJTestAwesomeResult
@synthesize subscriber = _subscriber;
- (void)onNext:(id)data {
    [_subscriber sendNext:data];
}

- (void)onComplete {
    [_subscriber sendCompleted];
    
}

- (void)onError:(NSError *)error {
    [_subscriber sendError:error];
}

- (id<MGJAwesomeEasyResult>)useEasyResult {
    return nil;
}

+ (instancetype)resultWithSubscriber:(id<RACSubscriber>)subscriber {
    return [[self alloc] initWithSubscriber:subscriber];
    
}
- (instancetype)initWithSubscriber:(id<RACSubscriber>)subscriber {
    self = [super init];
    if (self) {
        _subscriber = subscriber;
    }
    return self;
}
@end
