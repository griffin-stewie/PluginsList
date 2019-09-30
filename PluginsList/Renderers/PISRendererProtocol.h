//
//  PISRendererProtocol.h
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GRMustache/GRMustache.h>
#import "PISPluginModel.h"

@protocol PISRendererProtocol <NSObject>
+ (NSString *)identifier;
- (NSString *)identifier;
- (NSString *)displayName;
- (NSString *)fileExtension;
- (BOOL)supportClipboard;
- (GRMustacheFilter *)escapeFilter;
- (NSURL *)templateURL;
- (NSString *)renderWithPluginModels:(NSArray<PISPluginModel *> *)plugins error:(NSError **)error;
@end
