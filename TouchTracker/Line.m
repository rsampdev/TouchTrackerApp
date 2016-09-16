//
//  Line.m
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end {
    self = [super init];
    if (self) {
        _begin = begin;
        _end = end;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat:self.begin.x forKey:@"beginPointX"];
    [aCoder encodeFloat:self.begin.y forKey:@"beginPointY"];
    [aCoder encodeFloat:self.end.x forKey:@"endPointX"];
    [aCoder encodeFloat:self.end.y forKey:@"endPointY"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _begin.x = [aDecoder decodeFloatForKey:@"beginPointX"];
        _begin.y = [aDecoder decodeFloatForKey:@"beginPointY"];
        _end.x = [aDecoder decodeFloatForKey:@"endPointX"];
        _end.y = [aDecoder decodeFloatForKey:@"endPointY"];
    }
    return self;
}

@end
