//
//  PISBacklogTableRenderer.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISBacklogTableRenderer.h"
#import "PISBacklogTableEscapeFilter.h"

NSString * const PISExportFormatBacklog = @"backlog";

@implementation PISBacklogTableRenderer

+ (NSString *)identifier
{
    return PISExportFormatBacklog;
}

- (NSString *)displayName
{
    return @"Backlog Table";
}

- (NSString *)fileExtension
{
    return @"txt";
}

- (BOOL)supportClipboard
{
    return YES;
}

- (NSURL *)templateURL
{
    NSURL *URL = [[NSBundle bundleForClass:[self class]] URLForResource:@"backlog_table" withExtension:@"mustache"];
    return URL;
}

- (GRMustacheFilter *)escapeFilter
{
    return (GRMustacheFilter *)[[PISBacklogTableEscapeFilter alloc] init];
}

@end
