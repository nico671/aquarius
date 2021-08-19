#import <Preferences/PSListItemsController.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "NCUtils+UIColor.h"

@interface PSTableCell : UITableViewCell
@end
@interface ColoredListController : PSListItemsController

@end
@implementation ColoredListController

-(id) tableView: (UITableView *)arg1 cellForRowAtIndexPath:(NSIndexPath *)arg2 {     
    PSTableCell *cell = (PSTableCell *)[super tableView:arg1 cellForRowAtIndexPath:arg2];
    
    if (cell) {
          HBPreferences *file = [[HBPreferences alloc] initWithIdentifier:@"aquariusprefs"];
        int x = 0;
        NSMutableArray *actualColorsArray = [[NSMutableArray alloc]init];
        NSArray *colorsSavedArray = [file objectForKey:@"colorArray"];
        for (NSString *key in colorsSavedArray){
            UIColor *color = [UIColor colorFromHexString:key];
            [actualColorsArray insertObject:color atIndex:x];
            x++;
        }
      UIColor *tempColorForBackgroundColor = [actualColorsArray[arg2.row] colorWithAlphaComponent:1];
      UIView * tempBackgroundView = [[UIView alloc] init];
      tempBackgroundView.backgroundColor = tempColorForBackgroundColor;
      cell.backgroundView = tempBackgroundView; 
    }
     
    return cell;

}


@end