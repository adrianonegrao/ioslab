//
//  Contato.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 20/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@dynamic nome, telefone, email, endereco, site, foto, latitude, longitude;

-(NSString*) description{
    return [NSString stringWithFormat:@"Nome: %@, Telefone: %@, Email: %@, Endereço: %@, Site: %@",
            self.nome, self.telefone, self.email, self.endereco, self.site];
}

-(CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

-(NSString*)title{
    return self.nome;
}

-(NSString*)subtitle{
    return self.email;
}

@end
