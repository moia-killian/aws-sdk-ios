//
// Created by Stephan Jaetzold on 27.06.2018.
// Copyright (c) 2018 MOIA GmbH. All rights reserved.
//

#import "AWSIoTDataManager+RaceConditionWorkaround.h"
#import "AWSIoTMQTTClient.h"

@interface AWSIoTDataManager ()
@property (nonatomic, strong) AWSIoTMQTTClient *mqttClient;
@end

@interface AWSIoTMQTTClient ()
@property (nonatomic, strong) NSThread *streamsThread;
@end

@implementation AWSIoTDataManager (RaceConditionWorkaround)
- (NSThread *)mqttMessageThread {
    return self.mqttClient.streamsThread;
}
@end
