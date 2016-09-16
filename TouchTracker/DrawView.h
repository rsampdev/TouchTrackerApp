//
//  DrawView.h
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface DrawView : UIView

@property (nonatomic) NSMutableDictionary *currentLines;
@property (nonatomic) NSMutableArray *finishedLines;
@property (nonatomic) NSURL *linesArchiveURL;

- (BOOL)saveFinishedLines;

@end
