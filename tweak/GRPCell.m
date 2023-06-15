#import "GRPCell.h"
@implementation GRPCell
-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.layer.cornerRadius = 16;

        // Notification app icon
        self.iconView = [UIImageView new];
        self.iconView.userInteractionEnabled = NO;
        [self.countLabel setAutoresizingMask: UIViewAutoresizingFlexibleHeight];
        [self addSubview:self.iconView];

        self.iconView.layer.cornerRadius = 10;
        self.iconView.layer.cornerCurve = kCACornerCurveContinuous;
        self.iconView.clipsToBounds = YES;

        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.iconView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
        [self.iconView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
        [self.iconView.bottomAnchor constraintEqualToAnchor:self.centerYAnchor constant:5].active = YES;
        [self.iconView.widthAnchor constraintEqualToConstant:40].active = YES;

        // Notification count
        self.countLabel = [UILabel new];
        self.countLabel.layer.cornerRadius = 13;
        self.countLabel.userInteractionEnabled = NO;
        [self.countLabel setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
        [self addSubview:self.countLabel];

        self.countLabel.textAlignment = NSTextAlignmentCenter;
        self.countLabel.clipsToBounds = YES;
        self.countLabel.font = [UIFont systemFontOfSize:10];

        self.countLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.countLabel.leftAnchor constraintEqualToAnchor:self.iconView.leftAnchor].active = YES;
        [self.countLabel.rightAnchor constraintEqualToAnchor:self.iconView.rightAnchor].active = YES;
        [self.countLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
        [self.countLabel.heightAnchor constraintEqualToConstant:20].active = YES;

        self.countLabel.layer.cornerRadius = 10;
        self.countLabel.layer.cornerCurve = kCACornerCurveContinuous;
    }
    return self;
}
+ (CGSize) cellSize {
    return CGSizeMake(65, 65);
}
@end