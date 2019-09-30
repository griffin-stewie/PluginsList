//
//  PISBacklogTableEscapeFilter.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/27.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISBacklogTableEscapeFilter.h"

@implementation PISBacklogTableEscapeFilter
- (id)transformedValue:(id)object
{
    if ([object isKindOfClass: [NSString class]] == NO) {
        return object;
    }

    NSString *str = (NSString *)object;
    NSString *replaced = [str stringByReplacingOccurrencesOfString:@"|" withString:@"\\\\|"];

    return replaced;
}
@end
