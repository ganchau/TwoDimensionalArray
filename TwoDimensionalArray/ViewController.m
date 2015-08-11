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
    
    self.TwoDArray = @[@[@"💡", @"🌜", @"👬", @"🌃"],
                       @[@"💬", @"💳", @"🎫", @"📅"],
                       @[@"🚊", @"🍕", @"🎾", @"🚶"],
                       @[@"🌈", @"🍦", @"🚌", @"🎭"]];
    
    NSString *object1 = @"🎾";
    NSString *object2 = @"🎭";
    
    [self searchUsingTwoLoopsWithObject:object1];
    [self searchUsingOneLoopWithObject:object2];
}

- (void)searchUsingTwoLoopsWithObject:(NSString *)searchObj
{
    for (NSUInteger i = 0; i < self.TwoDArray.count; i++) {
        NSArray *rowArray = self.TwoDArray[i];
        for (NSUInteger j = 0; j < rowArray.count; j++) {
            if ([self.TwoDArray[i][j] isEqualToString:searchObj]) {
                NSLog(@"With two loops, %@ is at row: %lu col: %lu",
                      searchObj, i + 1, j + 1);
                return;
                // With two loops, 🎾 is at row: 3 col: 3
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
            NSLog(@"With one loop, %@ is at row: %lu, col: %lu", searchObj,
                  i + 1, [rowArray indexOfObjectIdenticalTo:searchObj] + 1);
            return;
            // With one loop, 🎭 is at row: 4, col: 4
        }
    }
    NSLog(@"WTF?!?");
}

@end
