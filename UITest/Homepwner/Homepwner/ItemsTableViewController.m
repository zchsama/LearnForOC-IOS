//
//  ItemsTableViewController.m
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import "ItemsTableViewController.h"
#import "Item.h"
#import "ItemStore.h"
#import "ItemCell.h"
#import "ItemViewController.h"
#import <Masonry/Masonry.h>

@interface ItemsTableViewController ()

@property (nonatomic, strong) UIView *myHeader;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *editButton;

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //获取状态栏高度
    NSUInteger statusBarHeight = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 65;
    
    [self setupHeaderViewUI];
    self.tableView.tableHeaderView = self.myHeader;
    
    [self.navigationItem setTitle:@"Homepwner"];
}

- (void) setupHeaderViewUI{
    self.myHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIViewAutoresizingFlexibleWidth, 60)];
    //[self.myHeader setBackgroundColor:[UIColor grayColor]];
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setTitle:@"Add" forState:UIControlStateNormal];
    [self.addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.editButton setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self.myHeader addSubview:self.addButton];
    [self.myHeader addSubview:self.editButton];
    
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.myHeader);
        make.top.mas_equalTo(self.myHeader).offset(20);
        make.left.mas_equalTo(self.myHeader).offset(100);
        make.width.mas_equalTo(@50);
    }];

    [self.editButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(self.myHeader);
        make.top.mas_equalTo(self.myHeader).offset(20);
        make.right.mas_equalTo(self.myHeader).offset(-100);
        make.width.mas_equalTo(@50);
    }];
    
    [self.editButton addTarget:self action:@selector(toggleEditingMode) forControlEvents:UIControlEventTouchUpInside];
    [self.addButton addTarget:self action:@selector(addNewItem) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) toggleEditingMode
{
    if(self.tableView.isEditing){
        [self.editButton setTitle:@"Edit" forState:UIControlStateNormal];
        [self.tableView setEditing:false animated:true];
    }
    else{
        [self.editButton setTitle:@"Done" forState:UIControlStateNormal];
        [self.tableView setEditing:true animated:true];
    }
}

- (void) addNewItem
{
    Item *newItem = [self.itemStore createItem: self.itemStore];
    
    NSUInteger index = [self.itemStore.items indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows

    return self.itemStore.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //注册
    Class myCell = [ItemCell class];
    [self.tableView registerClass:myCell forCellReuseIdentifier:@"ItemCell"];
    
    ItemCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    cell = [[ItemCell alloc] init];
    
    Item *item = self.itemStore.items[indexPath.row];
    
    cell.nameLabel.text = item.name;
    cell.serialNumberLabel.text = item.serialNumber;
    cell.valueLabel.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        Item *item = self.itemStore.items[indexPath.row];
        NSString *title = [NSString stringWithFormat:@"Delete %@?",item.name];
        NSString *message = @"Are u sure you want to delete?";
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
            [self.itemStore removeItem:item];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
        
        [ac addAction:cancelAction];
        [ac addAction:deleteAction];
        
        [self.navigationController pushViewController:ac animated:YES];
        
        //[self presentViewController:ac animated:true completion:nil];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    [self.itemStore moveItemFrom:fromIndexPath.row to:toIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemViewController *itemViewController = [ItemViewController new];
    Item *item = self.itemStore.items[indexPath.row];
    itemViewController.item.name = item.name;
    itemViewController.item.serialNumber = item.serialNumber;
    itemViewController.item.valueInDollars = item.valueInDollars;
    itemViewController.item.dateCreate = item.dateCreate;
    
    [self presentViewController:itemViewController animated:true completion:nil];
}
/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
