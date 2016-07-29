//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
#import "CoreDataInfra.h"

@interface ContatoDAO : NSObject

@property (strong) NSMutableArray<Contato*>* contatos;
@property (strong) CoreDataInfra* coreData;


+(ContatoDAO*) pegaInstancia;

-(void) adiciona: (Contato*) contato;

-(Contato*)buscaContatoDaPosicao:(NSInteger)posicao;

-(void)removeContatoDaPosicao:(NSInteger) posicao;

-(NSInteger)buscarPosicaoDoContato:(Contato*)contato;

-(Contato*)criaNovoContato;

-(void)salva;

@end
