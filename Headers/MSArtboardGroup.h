//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jul  6 2018 12:02:43).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Cocoa/Cocoa.h>

//#import "_MSArtboardGroup.h"
//
//#import "MSArtboardGroup-Protocol.h"
//#import "MSColorConvertible-Protocol.h"
//#import "MSLayerWithMutableBackgroundColor-Protocol.h"
//#import "MSRootLayer-Protocol.h"

@class MSArtboardPreset, MSColor, MSLayoutGrid, MSRulerData, MSSimpleGrid, NSString, MSLayer;

@interface MSArtboardGroup : MSLayerGroup

//+ (unsigned long long)traits;
//+ (struct CGRect)artboardRectFromLayersInArray:(id)arg1;
//- (void).cxx_destruct;
//- (void)setShouldBreakMaskChain:(BOOL)arg1;
//- (void)convertColorsUsing:(id)arg1;
//- (id)immutableBackgroundColor;
//- (id)closestClippingLayer;
//@property(readonly, nonatomic) struct CGRect contentBounds;
//- (id)rootForNameUniquing;
//- (void)moveChildrenToIdenticalPositionAfterResizeFromRect:(struct CGRect)arg1;
//- (struct CGSize)calculateMinimumSize;
//- (void)layerDidEndResize;
//- (void)layerDidResizeFromRect:(struct CGRect)arg1 corner:(long long)arg2;
//- (BOOL)isExpanded;
//- (BOOL)canRotate;
//- (id)otherArtboardUnderArtboard;
//- (void)moveBySuggestedOffset:(struct CGVector)arg1;
//@property(retain, nonatomic) MSArtboardPreset *preset;
//- (void)setRect:(struct CGRect)arg1;
//- (BOOL)resizeToFitChildrenWithOption:(long long)arg1;
//- (id)parentRoot;
//- (id)parentArtboard;
//- (void)refreshOverlayWithAbsoluteMargins:(struct CGSize)arg1;
//- (id)rulerCoordinateSpace;
//@property(nonatomic) struct CGPoint rulerBase;
//- (BOOL)constrainProportions;
//- (BOOL)isLocked;
//- (void)setIsLocked:(BOOL)arg1;
//@property(readonly, nonatomic) double rotation;
//- (BOOL)isOpen;
//- (BOOL)canBeTransformed;
//- (BOOL)isAutomaticScalingEnabled;
//- (BOOL)hasClickThrough;
//- (BOOL)hitTestInNameLabel:(struct CGPoint)arg1 zoomValue:(double)arg2;
//- (void)setIsVisible:(BOOL)arg1;
//- (BOOL)isSelectableOnCanvasWithOptions:(unsigned long long)arg1;
//- (id)defaultArtboardStyle;
//- (void)objectDidInit;
//- (void)performInitEmptyObject;
//- (void)adjustAfterInsert;
//- (BOOL)canBeHidden;
//- (BOOL)shouldRefreshOverlayForFlows;
//- (id)inspectorSections;
//- (void)applyScreenPickerColor:(id)arg1 preferredStyleName:(id)arg2;
//- (BOOL)canChangeBooleanOperation;
//- (BOOL)canCopyToLayer:(id)arg1 beforeLayer:(id)arg2;
//- (id)contextualMenuPreviewTemplateImage;
//- (id)unselectedPreviewTemplateImage;
//- (id)selectedPreviewTemplateImage;
//- (id)badgeImages;
//- (unsigned long long)displayType;
//- (struct CGRect)optimalBoundingBox;
//- (id)parentForInsertingLayers;
- (NSString *)displayName;
//- (BOOL)shouldResizeToFitRect:(struct CGRect)arg1;
//- (void)resizeToFitChildren;
//- (id)selectionHitTest:(struct CGPoint)arg1 options:(unsigned long long)arg2 zoomValue:(double)arg3;
- (id)parentRootForAbsoluteRect;

// Remaining properties
@property(readonly, nonatomic) struct CGAffineTransform CGTransformForFrame;
@property(retain, nonatomic) MSColor *backgroundColor;
@property(nonatomic) BOOL includeBackgroundColorInExport; // @synthesize includeBackgroundColorInExport=_includeBackgroundColorInExport;
@property(nonatomic) BOOL hasBackgroundColor; // @synthesize hasBackgroundColor=_hasBackgroundColor;
@property(readonly, nonatomic) struct CGRect bounds;
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
//@property(copy, nonatomic) MSSimpleGrid *grid;
@property(readonly, nonatomic) BOOL hasTransforms;
@property(readonly) unsigned long long hash;
//@property(copy, nonatomic) MSRulerData *horizontalRulerData;
//@property(readonly, nonatomic) struct BCEdgePaddings influenceRectEdgePaddingsThatCascadeToContainedLayers;
@property(readonly, nonatomic) BOOL isFlippedHorizontal;
@property(readonly, nonatomic) BOOL isFlippedVertical;
@property(readonly, nonatomic) BOOL isLayerExportable;
@property(readonly, nonatomic) BOOL isVisible;
//@property(copy, nonatomic) MSLayoutGrid *layout;
@property(readonly, nonatomic) NSString *objectID;
//@property(readonly, nonatomic) CGPoint origin;
//@property(readonly, nonatomic) CGRect rect;
@property(readonly) Class superclass;
//@property(copy, nonatomic) MSRulerData *verticalRulerData;

@end



