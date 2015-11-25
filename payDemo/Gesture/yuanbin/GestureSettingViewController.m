//
//  GestureSettingViewController.m
//  Gesture
//
//  Created by 袁斌 on 15/11/8.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "GestureSettingViewController.h"
#import "SettingCell.h"
#import "PasswordAccount.h"
#import "GestureViewController.h"
@interface GestureSettingViewController ()

@end

@implementation GestureSettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"手势";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadView) name:@"isSettingNotice" object:nil];
}
-(void)reloadView
{
    _isSetting = [PasswordAccount isOnWithNeedPassword];
    [self.tableView reloadData];
}
-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
         [self.tableView registerNib:[UINib nibWithNibName:@"SettingCell" bundle:nil]forCellReuseIdentifier:@"SettingCell"];
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return _isSetting ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    switch (section) {
        case 0:
            return _isSetting ? 2 : 1;
            break;
        default:
            return 1;
            break;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
     SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
        if (indexPath.row == 0) {
            cell.msgLabel.text = @"手势密码";
            cell.OnOrUp.on = [PasswordAccount isOnWithNeedPassword];
            [cell.OnOrUp addTarget:self action:@selector(setPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            cell.msgLabel.text = @"显示手势轨迹";
            cell.OnOrUp.on = [PasswordAccount isOnWithShowTrack];
            [cell.OnOrUp addTarget:self action:@selector(setTrackAction:) forControlEvents:UIControlEventTouchUpInside];

        }
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"修改手势密码";
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
}
-(void)setPasswordAction:(UISwitch *)sender
{
    if (sender.on == YES) {
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:ResetMode];
        ges.isFormer = NO;
        [self.navigationController pushViewController:ges animated:YES];
        
    }else{
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
        ges.isFormer = YES;
        [self.navigationController pushViewController:ges animated:YES];
        
    }
    
}
-(void)setTrackAction:(UISwitch *)sender
{
    [PasswordAccount showTrackIsOn:sender.on];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
        ges.isFormer = NO;
        [self.navigationController pushViewController:ges animated:YES];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

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
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com