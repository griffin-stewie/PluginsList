//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jul  6 2018 12:02:43).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#import "MSStyledLayer.h"

@class MSGroupLayout, NSArray, NSMutableArray, NSString;

@interface _MSLayerGroup : MSStyledLayer
{
    BOOL _hasClickThrough;
    NSString *_sharedObjectID;
    MSGroupLayout *_groupLayout;
    NSMutableArray *_layers;
}

+ (BOOL)allowsFaulting;
+ (Class)immutableClass;

- (void)syncPropertiesFromObject:(id)arg1;
- (BOOL)propertiesAreEqual:(id)arg1;
- (void)copyPropertiesToObject:(id)arg1 options:(unsigned long long)arg2;
- (void)setAsParentOnChildren;
- (void)moveLayerIndex:(unsigned long long)arg1 toIndex:(unsigned long long)arg2;
- (void)removeAllLayers;
- (void)removeLayersAtIndexes:(id)arg1;
- (void)removeLayerAtIndex:(unsigned long long)arg1;
- (void)removeLayer:(id)arg1;
- (void)insertLayers:(id)arg1 afterLayer:(id)arg2;
- (void)insertLayer:(id)arg1 afterLayer:(id)arg2;
- (void)insertLayers:(id)arg1 beforeLayer:(id)arg2;
- (void)insertLayer:(id)arg1 beforeLayer:(id)arg2;
- (void)insertLayer:(id)arg1 atIndex:(unsigned long long)arg2;
- (void)addLayers:(id)arg1;
- (void)addLayer:(id)arg1;
- (void)initializeUnsetObjectPropertiesWithDefaults;
- (BOOL)hasDefaultValues;
- (void)performInitEmptyObject;
@property(retain, nonatomic) NSArray *layers; // @synthesize layers=_layers;
@property(retain, nonatomic) MSGroupLayout *groupLayout; // @synthesize groupLayout=_groupLayout;
@property(retain, nonatomic) NSString *sharedObjectID; // @synthesize sharedObjectID=_sharedObjectID;
@property(nonatomic) BOOL hasClickThrough; // @synthesize hasClickThrough=_hasClickThrough;
- (void)performInitWithImmutableModelObject:(id)arg1;
//- (void)enumerateChildProperties:(CDUnknownBlockType)arg1;
//- (void)enumerateProperties:(CDUnknownBlockType)arg1;

@end

