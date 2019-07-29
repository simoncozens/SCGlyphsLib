//
//  GSLayer+SCLayerUtils.h
//  SuperTool
//
//  Created by Simon Cozens on 04/12/2017.
//  Copyright © 2017 Simon Cozens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <GlyphsCore/GlyphsCore.h>
#import <GlyphsCore/GSLayer.h>

@interface GSLayer (SCLayerUtils)

/*
    [layer coverage] returns the "black area" of a glyph as a percentage.

    It's an approximation formed by sampling a 100x100 grid from baseline to ascender.
    I tried exact methods using polygon area but it got complicated and buggy.
*/
-(CGFloat) coverage;

@end
