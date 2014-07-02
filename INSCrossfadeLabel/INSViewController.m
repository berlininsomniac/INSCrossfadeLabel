//
//  INSViewController.m
//  Berlin Insomniac
//
//  Created by Salánki, Benjamin on 02/07/14.
//  Copyright (c) 2014 Berlin Insomniac. All rights reserved.
//

#import "INSViewController.h"

@interface INSViewController ()

@property (nonatomic, strong) NSArray *content;

@end

@implementation INSViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder])
	{
		self.content = @[@"Into the flood again",
						 @"Same old trip it was back then",
						 @"So I made a big mistake",
						 @"Try to see it once my way"];
	}
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	self.label.text = [self.content firstObject];
}

- (IBAction)crossfade:(id)sender
{
	NSInteger i = [self.content indexOfObject:self.label.text];
	
	i++;
	
	if (i >= [self.content count])
	{
		i = 0;
	}
	
	self.label.text = [self.content objectAtIndex:i];
}

@end
