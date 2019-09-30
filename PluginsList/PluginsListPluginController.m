//
//  PluginsListPluginController.m
//  PluginsList
//
//  Created by griffin-stewie on 2019/09/10.
//  Copyright © 2019 cyan-stivy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PluginsListPluginController.h"
#import "MSDocumentData.h"
#import "MSDocument.h"
#import "MSPluginCommand.h"
#import "MSPluginBundle.h"

#import "PISPluginLoader.h"
#import "PISPluginModel.h"
#import "PISCSVRenderer.h"
#import "PISMarkdownTableRenderer.h"
#import "PISBacklogTableRenderer.h"

NSModalResponse SaveToFileButtonTag = 1000;
NSModalResponse CopyButtonTag = 1001;
NSModalResponse CancelButtonTag = 1002;

@interface PluginsListPluginController ( )
@property (nonatomic, copy) NSArray <NSObject <PISRendererProtocol> *> * formats;
@property (nonatomic, weak) NSAlert *alert;
@end


@implementation PluginsListPluginController

#pragma mark - Singleton

+ (instancetype)sharedController
{
    static dispatch_once_t once;
    static id _sharedInstance = nil;
    dispatch_once(&once, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

#pragma mark - Properties

- (void)setEnabled:(BOOL)enabled
{
    if (_enabled == enabled) {
        return;
    }
    NSLog(@"🤡 %s enabled: %@", __PRETTY_FUNCTION__, @(enabled));
    _enabled = enabled;

    if (enabled) {
        self.formats = @[
            [[PISMarkdownTableRenderer alloc] init],
            [[PISBacklogTableRenderer alloc] init],
            [[PISCSVRenderer alloc] init]
        ];
    } else {
        self.formats = nil;
    }
}

- (void)setPluginCommnad:(MSPluginCommand *)command
{
    _pluginCommnad = command;

    NSLog(@"🤡 %s %@", __PRETTY_FUNCTION__, _pluginCommnad);
}

- (void)setDocument:(MSDocument *)doc
{
    _document = doc;

    NSLog(@"🤡 %s %@", __PRETTY_FUNCTION__, @"setDocumentData is Called");

    if (_document != nil) {

    }
}

- (MSDocumentData *)documentData
{
    return self.document.documentData;
}

- (void)exportPluginsList
{
    self.alert = [self exportAlert];

    NSModalResponse responseCode = [self.alert runModal];
    NSPopUpButton *popUpButton = (NSPopUpButton *)[self.alert accessoryView];
    NSUInteger selection = [popUpButton indexOfSelectedItem];
    NSObject <PISRendererProtocol> *renderer = self.formats[selection];

    NSLog(@"🤡 %s Start exporting... responceCode:%@, rendererIdentifier:%@", __PRETTY_FUNCTION__, @(responseCode), [renderer identifier]);

    NSArray<PISPluginModel *> *plugins = [PISPluginLoader enabledPluginModels];
    NSError *error = nil;
    NSString *output = [renderer renderWithPluginModels:plugins error:&error];

    if (error != nil) {
        NSLog(@"🤡 ⛔️ %s Rendering error: %@", __PRETTY_FUNCTION__, error);
        [self.document showMessage:@"⚠️ Failed to render text."];
        return ;
    }

    NSLog(@"🤡 %s Rendering Output: %@", __PRETTY_FUNCTION__, output);

    if (responseCode == SaveToFileButtonTag) {

        NSSavePanel *panel = [NSSavePanel savePanel];
        NSString *fileName = [@"plugin_informations" stringByAppendingPathExtension:[renderer fileExtension]];
        [panel setNameFieldStringValue:fileName];
        [panel setAllowsOtherFileTypes:YES];
        [panel setExtensionHidden:NO];
        if ([panel runModal]) {
            [output writeToURL:[panel URL] atomically:true encoding:NSUTF8StringEncoding error:&error];
            if (error != nil) {
                NSLog(@"🤡 ⛔️ %s File writing error: %@", __PRETTY_FUNCTION__, error);
                [self.document showMessage:@"⚠️ Failed to write a file."];
                return ;
            }
            [self.document showMessage:@"Successfully saved!"];
        }

    } else if (responseCode == CopyButtonTag) {
        NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
        [pasteboard declareTypes:@[NSPasteboardTypeString] owner:nil];
        [pasteboard setString:output forType:NSPasteboardTypeString];
        [self.document showMessage:@"Successfully copied!"];
    }
}

- (NSAlert *)exportAlert
{
    NSMutableArray *names = [NSMutableArray arrayWithCapacity:self.formats.count];
    for (NSObject <PISRendererProtocol> *renderer in self.formats) {
        [names addObject:[renderer displayName]];
    }

    NSPopUpButton *accessory = [[NSPopUpButton alloc] initWithFrame:NSMakeRect(0, 0, 400, 25) pullsDown:false];
    [accessory addItemsWithTitles:names];
    [accessory selectItemAtIndex:0];
    [accessory setTarget:self];
    [accessory setAction:@selector(popUpButtonAction:)];

    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Export Plugin Informations"];
    [alert setInformativeText:@"Select the format:"];
    [alert addButtonWithTitle:@"Save to file..."];
    NSButton *copyButton = [alert addButtonWithTitle:@"Copy to pasteboard"];
    copyButton.tag = CopyButtonTag;
    [alert addButtonWithTitle:@"Cancel"];
    [alert setAccessoryView:accessory];

    return alert;
}

- (void)popUpButtonAction:(NSPopUpButton *)sender
{
    NSObject <PISRendererProtocol> *format = self.formats[sender.indexOfSelectedItem];
    NSButton *copyButton = [[[self.alert buttons] filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSButton * _Nullable button, NSDictionary<NSString *,id> * _Nullable bindings) {
        return (button.tag == CopyButtonTag) ? YES : NO;
    }]] firstObject];

    [copyButton setEnabled:[format supportClipboard]];
}

@end
