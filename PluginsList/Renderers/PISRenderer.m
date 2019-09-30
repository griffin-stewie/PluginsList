//
//  PISRenderer.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/28.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISRenderer.h"

@implementation PISRenderer

+ (NSString *)identifier
{
    // override point
    return nil;
}

- (NSString *)identifier
{
    // override point
    return [[self class] identifier];
}

- (NSString *)displayName
{
    // override point
    return nil;
}

- (NSString *)fileExtension
{
    // override point
    return nil;
}

- (BOOL)supportClipboard
{
    return YES;
}

- (NSURL *)templateURL
{
    // override point
    return nil;
}

- (GRMustacheFilter *)escapeFilter
{
    // override point
    return nil;
}

- (NSString *)renderWithPluginModels:(NSArray<PISPluginModel *> *)plugins error:(NSError **)error
{
    GRMustacheTemplate *template = [GRMustacheTemplate templateFromContentsOfURL:[self templateURL] error:error];

    if (*error != nil) {
        return nil;
    }

    id obj = @{
        @"plugins": plugins,
        @"escape": [self escapeFilter]
    };

    NSString *output = [template renderObject:obj error:error];
    if (*error != nil) {
        return nil;
    }

    return output;
}


@end
