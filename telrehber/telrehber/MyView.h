//
//  MyView.h
//  
//
//  Created by 2015 on 11.09.2015.
//
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MyKayitEkle.h"
#import "MyTelRehberTableViewController.h"


@interface MyView : UIViewController

@property Person *gonderilenKisi;

@property (weak, nonatomic) IBOutlet UILabel *isimText;

@property (weak, nonatomic) IBOutlet UILabel *soyisimText;

@property (weak, nonatomic) IBOutlet UILabel *telText;


@property (nonatomic) NSMutableDictionary *myKisi;




@end
