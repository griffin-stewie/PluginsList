//
//  PISPluginLoader.h
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/16.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PISPluginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PISPluginLoader : NSObject
+ (NSArray<PISPluginModel *> *)enabledPluginModels;
+ (NSArray<PISPluginModel *> *)disabledPluginModels;
@end

NS_ASSUME_NONNULL_END
