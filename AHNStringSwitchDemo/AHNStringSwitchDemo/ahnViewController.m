//
//  ahnViewController.m
//  AHNStringSwitchDemo
//
//  Created by Alexander Nagl on 10/8/13.
//  Copyright (c) 2013 Alexander Nagl. All rights reserved.
//

#import "ahnViewController.h"
#import "NSString+ahnStringSwitch.h"
@interface ahnViewController ()

@end

@implementation ahnViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *strOne = @"Hello World"; //Get the string you want to use
    
                             // Take the string and create the cases you want to check for
    bool switchStatement = [strOne switchWithCases:@[@"Hello", @"World", @"Hello World"] withStatements:
                            ^(NSString *caseString){ //Case "Hello" or first case
                                NSLog(@"%@",caseString);
                            },
                            ^(NSString *caseString){
                                //Case "World" or second case
                                NSLog(@"%@",caseString);
                            },
                            ^(NSString *caseString){
                                //Case "Hello World" or third case
                                //This block will be called
                                NSLog(@"%@",caseString);
                            }];
    //If none of those cases where used then switchStatement will return no, use this as your default
    if (!switchStatement){
        NSLog(@"None of these");
    }
    
    
    //What if you want to do some crazier, like search multiple a substrings may be in a string?
    //Easy you would then do...
    switchStatement = [strOne switchWithBoolBlock:^bool(NSString *baseString, NSString *caseString) {
        //baseString is the string you are searchign through
        //case string is your different cases
        if ([baseString rangeOfString:caseString].location!=NSNotFound){
            return YES;
        }else{
            return NO;
        }
        //The rest of the functions works just like the first function
    } WithCases:@[@"OMG", @"I am",@"searching for a substring", @"named", @"Hello"]  withStatements:
                       ^(NSString *caseString){//Case "OMG" or first case
                           NSLog(@"Found %@ in %@",caseString, strOne);
                       },
                       ^(NSString *caseString){//Case "I am" or second case
                           NSLog(@"Found %@ in %@",caseString, strOne);
                       },
                       ^(NSString *caseString){//Case "searching for a substring" or third case
                           NSLog(@"Found %@ in %@",caseString, strOne);
                       },
                       ^(NSString *caseString){//Case "named" or forth case
                           NSLog(@"Found %@ in %@",caseString, strOne);
                       },
                       ^(NSString *caseString){//Case "Hello" or second case
                           NSLog(@"Found %@ in %@",caseString, strOne);
                       }];
    
    //If none of those cases where used then switchStatement will return no, use this as your default
    if (!switchStatement){
        NSLog(@"None of these");
    }
    
    //But what if you want to search for both "Hello" AND "world" in "Hello World" and have it exicute code if each one if found.
    
    //Well then you would do...
    
    //stringFound will store all the strings that where found;
    NSArray *stringsFound = [strOne arraySwitchWithBoolBlock:^bool(NSString *baseString, NSString *caseString) {
        if ([baseString rangeOfString:caseString].location!=NSNotFound){
            return YES;
        }else{
            return NO;
        }
    } WithCases:@[@"Omg", @"I am searching for two strings called", @"Hello", @"World"]  withStatements:
                             ^(NSString *caseString) { //Case "Omg" or 1
                                 NSLog(@"Found %@ in %@", caseString, strOne);
                             },
                             ^(NSString *caseString) { //Case "I am searching for two strings called" or 2
                                 NSLog(@"Found %@ in %@", caseString, strOne);
                             },
                             ^(NSString *caseString) { //Case "Hello" or 3
                                 NSLog(@"Found %@ in %@", caseString, strOne);
                             },
                             ^(NSString *caseString) { //Case "world" or 4
                                 NSLog(@"Found %@ in %@", caseString, strOne);
                             }];
    
    //If stringsFound is less than 1, aka empty then none of those strings matches the block expresion
    if (stringsFound.count < 1){
        NSLog(@"None of these");
    }
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end
