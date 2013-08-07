//
//  TodoTableViewCell.h
//  Todo
//
//  Created by Jayesh Shah on 8/4/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\jayeshs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoTableViewCell : UITableViewCell {
        UITextField *textField;
    
}

@property (nonatomic, strong) IBOutlet UITextField *textField;


@end
