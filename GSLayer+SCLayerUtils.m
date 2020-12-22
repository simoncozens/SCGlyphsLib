//
//  GSLayer+SCLayerUtils.m
//  SuperTool
//
//  Created by Simon Cozens on 04/12/2017.
//  Copyright © 2017 Simon Cozens. All rights reserved.
//

#import "GSLayer+SCLayerUtils.h"

@implementation GSLayer (SCLayerUtils)

-(CGFloat) coverage {
    NSBezierPath* p = [self bezierPath];
    NSInteger black = 0;
    NSInteger white = 0;
    NSInteger x;
    NSInteger y;
    GSGlyphMetrics glyphMetrics = self.glyphMetrics;
    CGFloat ascender = glyphMetrics.ascender;
    CGFloat width = self.width;
    for (x = 0; x < width; x += width / 100) {
        for (y = 0; y < ascender; y += ascender / 100) {
            NSPoint pt = NSMakePoint(x, y);
            if ([p containsPoint:pt]) {
                black++;
            } else {
                white++;
            }
        }
    }
    return black / (CGFloat)(black + white);
//    int segments = (int)p.elementCount;
//    CGFloat white = self.width * (self.glyphMetrics.ascender - self.glyphMetrics.descender);
//    NSPoint curpoint;
//    for (int i=0; i<segments; i++) {
//        NSPoint pointArray[3];
//        float xa,ya,xb,yb,xc,yc,xd,yd;
//        NSBezierPathElement e = [p elementAtIndex:i
//                                 associatedPoints:pointArray];
//        switch(e) {
//            case NSMoveToBezierPathElement:
//                curpoint = pointArray[0];
//                break;
//            case NSCurveToBezierPathElement:
//                xa = curpoint.x; ya = curpoint.y / 20;
//                xb = pointArray[0].x; yb = pointArray[0].y / 20;
//                xc = pointArray[1].x; yc = pointArray[1].y / 20;
//                xd = pointArray[2].x; yd = pointArray[2].y / 20;
//                black -= (xb-xa)*(10*ya + 6*yb + 3*yc +   yd) + (xc-xb)*( 4*ya + 6*yb + 6*yc +  4*yd) +(xd-xc)*(  ya + 3*yb + 6*yc + 10*yd);
//                curpoint = pointArray[2];
//                break;
//            case NSLineToBezierPathElement:
//                xa = curpoint.x; ya = curpoint.y / 20;
//                xb = xa; yb = ya;
//                xc = pointArray[0].x; yc = pointArray[0].y / 20;
//                xd = xc; yd = yc;
//                black -= (xb-xa)*(10*ya + 6*yb + 3*yc +   yd) + (xc-xb)*( 4*ya + 6*yb + 6*yc +  4*yd) +(xd-xc)*(  ya + 3*yb + 6*yc + 10*yd);
//                curpoint = pointArray[0];
//                break;
//
//            case NSClosePathBezierPathElement:
//                /* Do nothing */;
//        }
//    }
//    return black/white;
}
@end
