//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jul  6 2018 12:02:43).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@interface MSLayerArray : NSObject <NSFastEnumeration>
{
    NSArray *_layers;
}

+ (id)emptyArray;
+ (id)arrayWithLayers:(id)arg1;
+ (id)arrayWithLayer:(id)arg1;
@property(copy, nonatomic) NSArray *layers; // @synthesize layers=_layers;

- (unsigned long long)hash;
- (BOOL)isEqual:(id)arg1;
- (id)description;
//- (id)sortedArrayByUsingComparator:(CDUnknownBlockType)arg1;
//- (BOOL)enumerateLayersWithOptions:(unsigned long long)arg1 block:(CDUnknownBlockType)arg2;
//- (void)enumerateLayers:(CDUnknownBlockType)arg1;
//- (unsigned long long)countByEnumeratingWithState:(CDStruct_70511ce9 *)arg1 objects:(id *)arg2 count:(unsigned long long)arg3;
- (unsigned long long)indexOfLayer:(id)arg1;
- (id)layerAtIndex:(unsigned long long)arg1;
- (id)lastLayer;
- (id)firstLayer;
- (BOOL)containsMultipleLayers;
- (BOOL)containsOneLayer;
- (BOOL)containsLayers;
- (BOOL)containsNoOrOneLayers;
- (unsigned long long)containedLayersCount;
- (id)containedLayers;
//- (id)filter:(CDUnknownBlockType)arg1;
//- (id)map:(CDUnknownBlockType)arg1;
- (id)commonArtboard;
- (id)layerToInsertAfter;
- (id)effectiveArtboard;
- (id)effectivePage;
- (id)uniqueParents;
- (id)parentOfFirstLayer;
//- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)initWithLayers:(id)arg1;
- (id)flowConnection;
- (void)removeUnusedStylePartsOfType:(unsigned long long)arg1;
- (id)addStylePartsOfType:(unsigned long long)arg1;
- (unsigned long long)indexOfLayerWithID:(id)arg1;
- (void)updateFlowDestinationsWithMapping:(id)arg1;
- (id)copyByGivingNewObjectIDs;

@end

