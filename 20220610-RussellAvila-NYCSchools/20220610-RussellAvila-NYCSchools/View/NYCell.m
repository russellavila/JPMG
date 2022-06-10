//
//  NYCell.m
//  20220610-RussellAvila-NYCSchools
//
//  Created by Consultant on 6/9/22.
//

#import "NYCell.h"

@implementation NYCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp {
    
    UILabel* schoolName = [[UILabel alloc] initWithFrame:CGRectZero];
    [schoolName setTranslatesAutoresizingMaskIntoConstraints:NO];
    [schoolName setNumberOfLines:0];
    [schoolName setTextAlignment:NSTextAlignmentCenter];
    [schoolName setText:@"Text Goes Here"];
    
    UILabel* schoolID = [[UILabel alloc] initWithFrame:CGRectZero];
    schoolID.layer.borderWidth = 2.0;
    [schoolID setTranslatesAutoresizingMaskIntoConstraints:NO];
    [schoolID setNumberOfLines:0];
    [schoolID setTextAlignment:NSTextAlignmentCenter];
    [schoolID setText:@"Text Goes Here"];
    
    [self.contentView addSubview:schoolID];
    [self.contentView addSubview:schoolName];
    
    [[schoolID.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    [[schoolID.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
    [[schoolID.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    
    [[schoolID.heightAnchor constraintEqualToConstant:140] setActive:YES];
    [[schoolID.widthAnchor constraintEqualToConstant:140] setActive:YES];
    
    [[schoolName.leadingAnchor constraintEqualToAnchor:schoolID.trailingAnchor constant:8] setActive:YES];
    [[schoolName.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[schoolName.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    
    self.schoolName = schoolName;
    self.schoolID = schoolID;
    
}

@end

