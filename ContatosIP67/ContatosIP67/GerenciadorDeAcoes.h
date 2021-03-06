//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 25/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contato.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contato* contato;
@property UIViewController* controller;

-(id)initWithContato:(Contato*) contato;

-(void)acoesDoController:(UIViewController*) controller;

@end