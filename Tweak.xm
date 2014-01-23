#import <CoreGraphics/CoreGraphics.h>

%hook SBRootIconListView

static BOOL isCorrectClass(id self)
{
	if ([self isMemberOfClass: [%c(SBRootIconListView) class]])
		return YES;
	else
		return NO;
}

+(unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1
{
	return 3;
}

-(unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1
{
	if (isCorrectClass(self))
		return 3;
	else
		return %orig();
}

-(void)setFrame:(struct CGRect)rect
{	
	if (isCorrectClass(self)){
		rect.size.width = 300.0;
		rect.origin.x += 10.0;
	}
	
	%orig();
}

%end