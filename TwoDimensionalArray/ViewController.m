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
@property (strong, nonatomic) NSString *object1;
@property (strong, nonatomic) NSString *object2;
@property (strong, nonatomic) NSString *object3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    [self initializeData];
    [self searchUsingTwoForLoopsWithObject:self.object1];
    [self searchUsingOneForLoopWithObject:self.object2];
    [self searchUsingNoForLoopsWithObject:self.object3];
}

- (void)initializeData
{
    self.TwoDArray = @[@[@"💡", @"🌜", @"👬", @"🌃"],
                       @[@"💬", @"💳", @"🎫", @"📅"],
                       @[@"🚊", @"🍕", @"🎾", @"🚶"],
                       @[@"🌈", @"🍦", @"🚌", @"🎭"]];
    
    self.object1 = @"🎾";
    self.object2 = @"🎭";
    self.object3 = @"👬";
}

- (void)searchUsingTwoForLoopsWithObject:(NSString *)searchObj
{
    for (NSUInteger i = 0; i < self.TwoDArray.count; i++) {
        NSArray *rowArray = self.TwoDArray[i];
        for (NSUInteger j = 0; j < rowArray.count; j++) {
            if ([self.TwoDArray[i][j] isEqualToString:searchObj]) {
                NSLog(@"With two For loops, %@ is at row: %lu col: %lu", searchObj, i + 1, j + 1);
                return;
                // With two For loops, 🎾 is at row: 3 col: 3
            }
        }
    }
    NSLog(@"WTF?!?");
}

- (void)searchUsingOneForLoopWithObject:(NSString *)searchObj
{
    for (NSUInteger i = 0; i < self.TwoDArray.count; i++) {
        NSArray *rowArray = self.TwoDArray[i];
        if ([rowArray containsObject:searchObj]) {
            NSLog(@"With one For loop, %@ is at row: %lu, col: %lu", searchObj, i + 1, [rowArray indexOfObjectIdenticalTo:searchObj] + 1);
            return;
            // With one For loop, 🎭 is at row: 4, col: 4
        }
    }
    NSLog(@"WTF?!?");
}

// Search through the array using NSArray's method enumerateObjectUsingBlock
// If the obj is found, set *stop to YES and output the result
// Return in this case will not work like in previous examples because we are dealing with a block
// Therefore, the next command after the enumerate method will still execute
// One way to remedy this is to check if we are at the last index and if we don't find the object, then print out the error message
 
- (void)searchUsingNoForLoopsWithObject:(NSString *)searchObj
{
    [self.TwoDArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSArray *rowArray = (NSArray *)obj;
        if ([rowArray containsObject:searchObj]) {
            NSLog(@"With no For loops, %@ is at row: %lu col: %lu", searchObj, idx + 1, [rowArray indexOfObjectIdenticalTo:searchObj] + 1);
            *stop = YES;
            // With no For loops, 👬 is at row: 1 col: 3
        }
        if (self.TwoDArray.count == idx + 1) {
            NSLog(@"WTF!?");
        }
    }];
}

@end
