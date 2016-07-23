//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property (strong) NSMutableArray<Contato*>* contatos;

+(ContatoDAO*) pegaInstancia;

-(void) adiciona: (Contato*) contato;

-(Contato*)buscaContatoDaPosicao:(NSInteger)posicao;

-(void)removeContatoDaPosicao:(NSInteger) posicao;

-(NSInteger)buscarPosicaoDoContato:(Contato*)contato;



@end
