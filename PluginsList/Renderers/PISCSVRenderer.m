//
//  PISCSVRenderer.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISCSVRenderer.h"
#import "PISCSVEscapeFilter.h"

NSString * const PISExportFormatCSV = @"csv";

@implementation PISCSVRenderer

+ (NSString *)identifier
{
    return PISExportFormatCSV;
}

- (NSString *)displayName
{
    return @"CSV";
}

- (NSString *)fileExtension
{
    return @"csv";
}

- (NSURL *)templateURL
{
    NSURL *URL = [[NSBundle bundleForClass:[self class]] URLForResource:@"csv" withExtension:@"mustache"];
    return URL;
}

- (GRMustacheFilter *)escapeFilter
{
    return (GRMustacheFilter *)[[PISCSVEscapeFilter alloc] init];
}

@end
