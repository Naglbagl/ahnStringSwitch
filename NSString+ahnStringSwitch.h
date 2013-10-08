//
//  NSString+StringSwitch.h
//  stringSwitch
//
//  Created by Alexander Nagl on 7/17/13.
//  Copyright (c) 2013 Alexander Nagl. All rights reserved.
/*
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

@interface NSString (StringSwitch)

//Basic switch compairing strings
-(bool)switchWithCases:(NSArray *)cases withStatements:(void(^)(NSString *caseString))statements,...;

//Switch where you give it a bool operator it will use to compair the strings with. If it find a match it will stop compairing the rest of the strings

-(bool)switchWithBoolBlock:(bool(^)(NSString *baseString, NSString *caseString))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(NSString *caseString))statements,...;

//Switch where you give it a bool returning block it will use to compair the strings with. If it find a match it will add it to the return array
-(NSArray*)arraySwitchWithBoolBlock:(bool(^)(NSString *baseString, NSString *caseString))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(NSString *caseString))statements,...;


@end
