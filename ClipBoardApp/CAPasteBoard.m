//
//  CAPasteBoard.m
//  ClipBoardApp
//
//  Created by chetu on 13/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CAPasteBoard.h"

@implementation CAPasteBoard
+(CAPasteBoard *) sharedPasteBoard {
    static CAPasteBoard *pasteBoard = nil;
    
    if (!pasteBoard) {
        pasteBoard = [[CAPasteBoard alloc] init];
    }
    return pasteBoard;
}

- (BOOL) addItem:(id) item {
    
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    NSLog(@"%@",pb.items);
    
    NSString *key = @"";
    if ([item isKindOfClass:[NSString class]]) {
        key = @"String";
    }else if ([item isKindOfClass:[NSURL class]]) {
        key = @"URL";
    }else if ([item isKindOfClass:[UIImage class]]) {
        key = @"Image";
    }
    if (pb.items.count > 0) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (NSDictionary *object in pb.items) {
            if (![object objectForKey:key]) {
                [array addObject:object];
            }
        }
        [pb setItems:array];
    }
    
    NSMutableDictionary *dict =[[NSMutableDictionary alloc] init];
    [dict setObject:item forKey:key];
    
    [pb addItems:[NSArray arrayWithObjects:dict, nil]];
    
    return YES;
}

- (void) showClipBoardToView:(id)view {
//    UIPasteboard *pb = [UIPasteboard generalPasteboard];
//    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select file" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
//  
//    NSInteger count = 0;
//    for (id obj in pb.items) {
//        if ([obj isKindOfClass:[NSDictionary class]]) {
//            if ([(NSDictionary *)obj allKeys].count > 0) {
//                 [actionSheet addButtonWithTitle:[[(NSDictionary *)obj allKeys] objectAtIndex:0]];
//            }
//        }
//        else {
//            [actionSheet addButtonWithTitle:[NSString stringWithFormat:@"%@%d",@"unknown", count++]];
//        }
//    }
//    [actionSheet addButtonWithTitle:@"Cancel"];
//    [actionSheet setCancelButtonIndex:[actionSheet numberOfButtons]-1];
//    [actionSheet showInView:view];
    
    UIMenuController *menuC = [UIMenuController sharedMenuController];
    
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"chandan" action:@selector(onCustom1:)];
    
    [menuC setMenuItems:[NSArray arrayWithObject:item]];
    [menuC setTargetRect:CGRectMake(0, 40, 75, 45) inView:view];
    [menuC setMenuVisible:YES animated:YES];
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
}



/*if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSMutableString class]]) {
 [actionSheet addButtonWithTitle:obj];
 }
 else {
 [actionSheet addButtonWithTitle:[NSString stringWithFormat:@"%@%d",@"unknown", count++]];
 } */


- (void) onCustom1: (UIMenuController*) sender
{
}

@end
