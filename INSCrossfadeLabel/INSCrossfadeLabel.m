//
//  INSCrossfadeLabel.m
//  Berlin Insomniac
//
//  Created by Salánki, Benjamin on 02/07/14.
//  Copyright (c) 2014 Berlin Insomniac. All rights reserved.
//

#import "INSCrossfadeLabel.h"

@interface INSCrossfadeLabel ()

/**
 *  A label used when animating the 'from' value.
 */

@property (nonatomic, strong) UILabel *underlayLabel;

/**
 *  A label used when animating the 'to' value.
 */

@property (nonatomic, strong) UILabel *overlayLabel;

@end

@implementation INSCrossfadeLabel

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
        // Initialization code
		[self setup];
    }
	
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
	{
        // Initialization code
		[self setup];
    }
	
    return self;
}

- (void)setup
{
	self.underlayLabel = [[UILabel alloc] initWithFrame:self.bounds];
	self.underlayLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.underlayLabel.alpha = 0.0;
	
	[self addSubview:self.underlayLabel];
	
	self.overlayLabel = [[UILabel alloc] initWithFrame:self.bounds];
	self.overlayLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.overlayLabel.alpha = 0.0;
	
	[self addSubview:self.overlayLabel];
}

#pragma mark - method overrides

- (void)setFont:(UIFont *)font
{
	[super setFont:font];
	
	self.underlayLabel.font = font;
	self.overlayLabel.font = font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
	[super setTextAlignment:textAlignment];
	
	self.underlayLabel.textAlignment = textAlignment;
	self.overlayLabel.textAlignment = textAlignment;
}

- (void)setTextColor:(UIColor *)textColor
{
	[super setTextColor:textColor];
	
	self.underlayLabel.textColor = textColor;
	self.overlayLabel.textColor = textColor;
}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor
{
	[super setHighlightedTextColor:highlightedTextColor];
	
	self.underlayLabel.highlightedTextColor = highlightedTextColor;
	self.overlayLabel.highlightedTextColor = highlightedTextColor;
}

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	
	self.underlayLabel.highlighted = highlighted;
	self.overlayLabel.highlighted = highlighted;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines
{
	[super setNumberOfLines:numberOfLines];
	
	self.underlayLabel.numberOfLines = numberOfLines;
	self.overlayLabel.numberOfLines = numberOfLines;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
	[super setLineBreakMode:lineBreakMode];
	
	self.underlayLabel.lineBreakMode = lineBreakMode;
	self.overlayLabel.lineBreakMode	= lineBreakMode;
}

#pragma mark - getting / setting text

- (NSAttributedString *)attributedText
{
	NSAttributedString *retVal = [super attributedText];
	
	if (!retVal && self.overlayLabel.attributedText)
	{
		retVal = self.overlayLabel.attributedText;
	}
	
	return retVal;
}

- (NSString *)text
{
	NSString *retVal = [super text];
	
	if (!retVal && self.overlayLabel.text)
	{
		retVal = self.overlayLabel.text;
	}
	
	return retVal;
}

- (void)setText:(NSString *)text
{
	[self.layer removeAllAnimations];
		
	if (!super.text && self.overlayLabel.text)
	{
		[super setText:self.overlayLabel.text];
		self.overlayLabel.alpha = 0.0;
		self.overlayLabel.text = nil;
	}
	
	self.underlayLabel.text = super.text;
	self.underlayLabel.alpha = 1.0;
	super.text = nil;

	self.overlayLabel.text = text;
	
	[UIView animateWithDuration:0.5 animations:^{

		self.underlayLabel.alpha = 0.0;
		self.overlayLabel.alpha = 1.0;

	} completion:^(BOOL finished) {
		
		if (finished)
		{
			super.text = text;
			self.overlayLabel.alpha = 0.0;
			self.underlayLabel.alpha = 0.0;
			self.overlayLabel.text = nil;
			self.underlayLabel.text = nil;
		}

	}];
}

@end
