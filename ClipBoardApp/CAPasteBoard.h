//
//  CAPasteBoard.h
//  ClipBoardApp
//
//  Created by chetu on 13/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAPasteBoard : NSObject <UIActionSheetDelegate>
+(CAPasteBoard *) sharedPasteBoard;
- (BOOL) addItem:(id) item;

- (void) showClipBoardToView:(id)view;
@end
