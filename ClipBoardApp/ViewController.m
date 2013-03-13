//
//  ViewController.m
//  ClipBoardApp
//
//  Created by chetu on 13/03/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CAPasteBoard.h"
@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnActionClicked:(id)sender {
    if ([(UIButton *)sender tag] == 10) {
         [[CAPasteBoard sharedPasteBoard] addItem:@"my test string"];
    }
    else if ([(UIButton *)sender tag] == 11) {
         [[CAPasteBoard sharedPasteBoard] addItem:[UIImage imageNamed:@"download.jpeg"]];
    }
    else if ([(UIButton *)sender tag] == 12) {
        [[CAPasteBoard sharedPasteBoard] showClipBoardToView:self.view];
    }
}


@end
