ahnStringSwitch
===============

A switch like function for NSStrings in Objective-C

Example:

    NSString *strOne = @"Hello World"; //Get the string you want to use
        
                         // Take the string and create the cases you want to check for
    bool switchStatement = [strOne switchWithCases:@[@"Hello", @"World", @"Hello World"] withStatements:
     ^{ //Case "Hello" or first case
         NSLog(@"Hello");
     },
     ^{
         //Case "World" or secound case
         NSLog(@"World");
     },
     ^{
         //Case "Hello World" or third case
         //This block will be called
         NSLog(@"Hello World"); 
     }];
    
    
    //If none of those cases where used then switchStatement will return no, use this as your default 
    if (!switchStatement){
        NSLog(@"None of these");
    }
