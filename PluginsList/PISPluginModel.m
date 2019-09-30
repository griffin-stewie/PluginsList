//
//  PISPluginModel.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/16.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import "PISPluginModel.h"

#import "MSPluginBundle.h"

@interface PISPluginModel ( )
@property (nonatomic, strong) MSPluginBundle *pluginBundle;
@end


@implementation PISPluginModel

- (instancetype)initWithPluginBundle:(MSPluginBundle *)bundle
{
    self = [super init];
    if (self) {
        _pluginBundle = bundle;
    }
    return self;
}


//@property(nonatomic, getter=isEnabled) BOOL enabled; // @synthesize enabled=_enabled;

- (BOOL)isEnabled
{
    return self.pluginBundle.isEnabled;
}

- (void)setEnabled:(BOOL)enabled
{
    self.pluginBundle.enabled = enabled;
}

//@property(readonly, copy, nonatomic) NSString *maximumCompatibleVersion; // @synthesize maximumCompatibleVersion=_maximumCompatibleVersion;
//@property(readonly, copy, nonatomic) NSString *compatibleVersion; // @synthesize compatibleVersion=_compatibleVersion;
//@property(readonly, copy, nonatomic) NSURL *appcastURL; // @synthesize appcastURL=_appcastURL;
//@property(readonly, copy, nonatomic) NSString *authorEmail; // @synthesize authorEmail=_authorEmail;
//@property(readonly, copy, nonatomic) NSString *author; // @synthesize author=_author;
//@property(readonly, copy, nonatomic) NSURL *homepageURL; // @synthesize homepageURL=_homepageURL;
- (NSURL *)homepageURL
{
    return self.pluginBundle.homepageURL;
}

//@property(readonly, copy, nonatomic) NSString *pluginDescription; // @synthesize pluginDescription=_pluginDescription;
//@property(readonly, copy, nonatomic) NSString *identifier; // @synthesize identifier=_identifier;


//@property(readonly, copy, nonatomic) NSString *name; // @synthesize name=_name;
- (NSString *)name
{
    return self.pluginBundle.name;
}

//@property(readonly, copy, nonatomic) NSString *version; // @synthesize version=_version;
- (NSString *)version
{
    return self.pluginBundle.version;
}


//@property(readonly, copy, nonatomic) NSURL *url; // @synthesize url=_url;



@end
