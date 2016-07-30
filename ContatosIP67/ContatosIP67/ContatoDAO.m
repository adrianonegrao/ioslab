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
        
        self.coreData = [CoreDataInfra new];
        
        
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

-(NSInteger)buscarPosicaoDoContato:(Contato *)contato{
    return [self.contatos indexOfObject:contato];
}

-(Contato*)criaNovoContato{
    return [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:self.coreData.managedObjectContext];
}

-(void)salva{
    [self.coreData saveContext];
}

-(void)listaContatos{
    NSFetchRequest* query = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSSortDescriptor* ordemAlfabetica = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    query.sortDescriptors = @[ordemAlfabetica];
    NSArray* retorno = [self.coreData.managedObjectContext executeFetchRequest:query
                                                      error:nil];
    self.contatos = [retorno mutableCopy];
}

@end
