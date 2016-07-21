//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO* instancia;

-(NSObject*) init{
    self = [super init];
    if(self != nil){
        self.contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatoDAO*) pegaInstancia{
    if(!instancia){
        instancia = [ContatoDAO new];
    }
    return instancia;
}

-(void)adiciona:(Contato*)contato{
    [self.contatos addObject: contato];
    NSLog(@"Contatos: %@", self.contatos);
}

-(Contato*)buscaContatoDaPosicao:(NSInteger)posicao{
    return self.contatos[posicao];
}


-(void)removeContatoDaPosicao:(NSInteger) posicao{
    [self.contatos removeObjectAtIndex:posicao];
}

@end
