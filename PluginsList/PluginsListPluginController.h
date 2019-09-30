//
//  PluginsListPluginController.h
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/10.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSDocumentData, MSDocument, MSPluginCommand;

NS_ASSUME_NONNULL_BEGIN

@interface PluginsListPluginController : NSObject

@property (nonatomic, assign, getter=isEnabled) BOOL enabled;
@property (nonatomic, weak) MSPluginCommand *pluginCommnad;
@property (nonatomic, weak) MSDocument *document;
@property (nonatomic, weak, readonly) MSDocumentData *documentData;

+ (instancetype)sharedController;

- (void)exportPluginsList;

@end

NS_ASSUME_NONNULL_END
