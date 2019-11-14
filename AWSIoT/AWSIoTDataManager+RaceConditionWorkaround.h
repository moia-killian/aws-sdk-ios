//
// Created by Stephan Jaetzold on 27.06.2018.
// Copyright (c) 2018 MOIA GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWSIoTDataManager.h"

@interface AWSIoTDataManager (RaceConditionWorkaround)
/// Expose an internal thread of the SDK to work around a possible crash when a message is received
/// at the same time as e.g. subscribing to a topic
/// See https://github.com/moia-dev/neptune-frontend/pull/622 for more details
@property (nonatomic, strong, readonly, nullable) NSThread *mqttMessageThread;
@end
