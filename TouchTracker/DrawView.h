//
//  DrawView.h
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface DrawView : UIView <UIGestureRecognizerDelegate>

@property (nonatomic) NSMutableDictionary *currentLines;
@property (nonatomic) NSMutableArray *finishedLines;
@property (nonatomic) NSURL *linesArchiveURL;
@property (nonatomic, weak) Line *selectedLine;
@property (nonatomic) UIPanGestureRecognizer *moveRecognizer;

- (BOOL)saveFinishedLines;

@end
