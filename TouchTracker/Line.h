//
//  Line.h
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Line : NSObject <NSCoding>

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

- (instancetype)initWithBegin:(CGPoint)begin end:(CGPoint)end;

@end
