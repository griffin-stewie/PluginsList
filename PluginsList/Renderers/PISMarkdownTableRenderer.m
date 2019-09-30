//
//  PISMarkdownTableRenderer.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISMarkdownTableRenderer.h"
#import "PISMarkdownTableEscapeFilter.h"

NSString * const PISExportFormatMarkdown = @"markdown";

@implementation PISMarkdownTableRenderer

+ (NSString *)identifier
{
    return PISExportFormatMarkdown;
}

- (NSString *)displayName
{
    return @"Markdown Table";
}

- (NSString *)fileExtension
{
    return @"md";
}

- (NSURL *)templateURL
{
    NSURL *URL = [[NSBundle bundleForClass:[self class]] URLForResource:@"markdown_table" withExtension:@"mustache"];
    return URL;
}

- (GRMustacheFilter *)escapeFilter
{
    return (GRMustacheFilter *)[[PISMarkdownTableEscapeFilter alloc] init];
}

@end
