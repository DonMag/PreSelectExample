//
//  ClientTableViewCell.m
//  PreSelectExample
//
//  Created by Don Mag on 9/5/21.
//  Copyright © 2021 Don Mag. All rights reserved.
//

#import "ClientTableViewCell.h"

@interface ClientTableViewCell()
{
	UIImage *selectedImg;
	UIImage *unselectedImg;
}
@end

@implementation ClientTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		[self initialize];
	}
	return self;
}

- (void)initialize {
	
	selectedImg = [UIImage systemImageNamed:@"checkmark.square"];
	unselectedImg = [UIImage systemImageNamed:@"square"];
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

	self.textLabel.textColor = selected ? [UIColor redColor] : [UIColor blackColor];
	self.imageView.image = selected ? selectedImg : unselectedImg;
	
}

@end
