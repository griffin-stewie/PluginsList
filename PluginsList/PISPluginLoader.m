//
//  PISPluginLoader.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/16.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PISPluginLoader.h"

#import "AppController.h"
#import "MSPluginManagerWithActions.h"
#import "MSPluginBundle.h"

typedef enum : NSUInteger {
    PISPluginTypeEnabled,
    PISPluginTypeDisabled,
} PISPluginType;

@implementation PISPluginLoader

+ (NSArray<PISPluginModel *> *)enabledPluginModels
{
    return [self pluginModelsWithType:PISPluginTypeEnabled];
}

+ (NSArray<PISPluginModel *> *)disabledPluginModels
{
    return [self pluginModelsWithType:PISPluginTypeDisabled];
}


+ (NSArray<PISPluginModel *> *)pluginModelsWithType:(PISPluginType)type
{
    MSPluginManagerWithActions *manager = [[NSClassFromString(@"AppController") sharedInstance] pluginManager];
    NSArray<MSPluginBundle *> *pluginBundles = nil;
    
    switch (type) {
        case PISPluginTypeEnabled:
            pluginBundles = [manager enabledPlugins];
            break;
        case PISPluginTypeDisabled:
            pluginBundles = [manager disabledPlugins];
            break;
        default:
            break;
    }

    NSMutableArray *models = [NSMutableArray array];

    for (MSPluginBundle *bundle in pluginBundles) {
//        NSLog(@"🤡 %s %@ %@", __PRETTY_FUNCTION__, [bundle debugDescription], @([bundle isEnabled]));
        PISPluginModel *model = [[PISPluginModel alloc] initWithPluginBundle:bundle];
        [models addObject:model];
    }
    
    [models sortUsingComparator:^NSComparisonResult(PISPluginModel *  _Nonnull obj1, PISPluginModel *  _Nonnull obj2) {
        return [[obj1 name] compare:[obj2 name]];
    }];

    return [models copy];
}

@end
