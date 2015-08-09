//
//  ViewController.m
//  TwoDimensionalArray
//
//  Created by Gan Chau on 8/8/15.
//  Copyright (c) 2015 GC App. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *TwoDArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.TwoDArray = @[@[@"0", @"1", @"2", @"3"],
                       @[@"4", @"5", @"6", @"7"],
                       @[@"8", @"9", @"a", @"b"],
                       @[@"c", @"d", @"e", @"f"]];
    
    NSString *object1 = @"9";
    NSString *object2 = @"a";
    
    [self searchUsingTwoLoopsWithObject:object1];
    [self searchUsingOneLoopWithObject:object2];
}

- (void)searchUsingTwoLoopsWithObject:(NSString *)searchObj
{
    for (NSUInteger i = 0; i < self.TwoDArray.count; i++) {
        NSArray *rowArray = self.TwoDArray[i];
        for (NSUInteger j = 0; j < rowArray.count; j++) {
            if ([self.TwoDArray[i][j] isEqualToString:searchObj]) {
                NSLog(@"Using two loops, '%@' found at row: %lu, column: %lu", searchObj, i + 1, j + 1);
                return;
            }
        }
    }
    NSLog(@"WTF?!?");
}

- (void)searchUsingOneLoopWithObject:(NSString *)searchObj
{
    for (NSUInteger i = 0; i < self.TwoDArray.count; i++) {
        NSArray *rowArray = self.TwoDArray[i];
        if ([rowArray containsObject:searchObj]) {
            NSLog(@"Using one loop, '%@' found at row: %lu, column: %lu", searchObj, i + 1, [rowArray indexOfObjectIdenticalTo:searchObj] + 1);
            return;
        }
    }
    NSLog(@"WTF?!?");
}

@end
