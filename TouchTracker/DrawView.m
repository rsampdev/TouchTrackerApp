//
//  DrawView.m
//  TouchTracker
//
//  Created by Rodney Sampson on 9/15/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _finishedLines = [[NSMutableArray alloc] init];
        _currentLines = [[NSMutableDictionary alloc] init];
        
        NSArray *directories = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        NSURL *documentDirectory = directories.firstObject;
        _linesArchiveURL = [documentDirectory URLByAppendingPathComponent:@"items.archive"];
        NSArray *loadedItems = [NSKeyedUnarchiver unarchiveObjectWithFile:self.linesArchiveURL.path];
        [_finishedLines addObjectsFromArray:loadedItems];
    }
    return self;
}

- (BOOL)saveFinishedLines {
    NSLog(@"Saving the store to %@", self.linesArchiveURL);
    return [NSKeyedArchiver archiveRootObject:self.finishedLines toFile:self.linesArchiveURL.path];
}

- (void)strokeLine:(Line *)line {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 10;
    path.lineCapStyle = kCGLineCapRound;
    [path moveToPoint:line.begin];
    [path addLineToPoint:line.end];
    [path stroke];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    for (Line *line in self.finishedLines) {
        [self strokeLine:line];
    }
    [[UIColor redColor] setStroke];
    for (Line *line in self.currentLines.allValues) {
        [self strokeLine:line];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self];
        Line *newLine = [[Line alloc] initWithBegin:location end:location];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        self.currentLines[key] = newLine;
    }
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        Line *line = self.currentLines[key];
        line.end = location;
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        Line *line = self.currentLines[key];
        line.end = location;
        [self.finishedLines addObject:line];
        [self.currentLines removeObjectForKey:key];
    }
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self.currentLines removeAllObjects];
    [self setNeedsDisplay];
}

@end
