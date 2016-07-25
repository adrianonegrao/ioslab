//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 25/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes

-(id)initWithContato:(Contato *)contato{
    self = [super init];
    if(self){
        self.contato = contato;
    }
    return self;
}

-(void)acoesDoController:(UIViewController *)controller{
    self.controller = controller;
    UIActionSheet* opcoes = [[UIActionSheet alloc]
                             initWithTitle: self.contato.nome
                             delegate:self
                             cancelButtonTitle:@"Cancelar"
                             destructiveButtonTitle:nil
                             otherButtonTitles:@"Ligar", @"Enviar Email", @"Visualizar site", @"Abrir mapa", nil];
    [opcoes showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet*) actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}

@end
