//
//  PISPluginModel.h
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/16.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSPluginBundle;

NS_ASSUME_NONNULL_BEGIN

@interface PISPluginModel : NSObject

@property(nonatomic, getter=isEnabled) BOOL enabled; // @synthesize enabled=_enabled;
//@property(readonly, copy, nonatomic) NSString *maximumCompatibleVersion; // @synthesize maximumCompatibleVersion=_maximumCompatibleVersion;
//@property(readonly, copy, nonatomic) NSString *compatibleVersion; // @synthesize compatibleVersion=_compatibleVersion;
//@property(readonly, copy, nonatomic) NSURL *appcastURL; // @synthesize appcastURL=_appcastURL;
//@property(readonly, copy, nonatomic) NSString *authorEmail; // @synthesize authorEmail=_authorEmail;
//@property(readonly, copy, nonatomic) NSString *author; // @synthesize author=_author;
@property(readonly, copy, nonatomic) NSURL *homepageURL; // @synthesize homepageURL=_homepageURL;
//@property(readonly, copy, nonatomic) NSString *pluginDescription; // @synthesize pluginDescription=_pluginDescription;
//@property(readonly, copy, nonatomic) NSString *identifier; // @synthesize identifier=_identifier;
@property(readonly, copy, nonatomic) NSString *name; // @synthesize name=_name;
@property(readonly, copy, nonatomic) NSString *version; // @synthesize version=_version;
//@property(readonly, copy, nonatomic) NSURL *url; // @synthesize url=_url;


- (instancetype)initWithPluginBundle:(MSPluginBundle *)bundle;
@end

NS_ASSUME_NONNULL_END
