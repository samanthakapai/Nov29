#import "ViewController.h"
#import "View.h"


@implementation ViewController

/*
 - (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
 {
 self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */


- (void) loadView {
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame controller: self];
}


- (void) didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
}

- (void) viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
	// Return YES for supported orientations
	//return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;	//allow every interface orientation
}

@end