public with sharing class PokemonController {
        @AuraEnabled(Cacheable=true)
        public static Pokemon__c[] getAllPokemons() {//método devuelve el resultado de una consulta que recupera todos los registros de Pokes
            return [
                SELECT
                   Id,
                    Name,
                    Altura__c,
                    Peso__c,
                    PokeIndex__c,
                    Foto__c,
                    Tipo__c,
                    Generation__c
                   
                FROM Pokemon__c
                WITH SECURITY_ENFORCED
                ORDER BY PokeIndex__c
                LIMIT 200
            ];
        }
    
      
        @AuraEnabled(Cacheable=true)
        public static Pokemon__c[] searchPokemons(String searchTerm, String tipo, Integer generacion) {
            // Return all pokemons when no search term
            if (String.isBlank(tipo) && generacion == null && String.isBlank(searchTerm)) {
                return getAllPokemons();//si no filtro la busqueda obtendre todos los pokemones disponibles
            }
            // Prepare query paramters
            searchTerm = '%' + searchTerm + '%';

            String query = 'SELECT Id, Name, Altura__c, Peso__c, PokeIndex__c,  Foto__c,  Tipo__c, Generation__c FROM Pokemon__c';
    
            if(!String.isBlank(searchTerm) && generacion == null && String.isBlank(tipo)){
                query += ' WHERE Name LIKE :searchTerm';//busco por nombre
            } 
            else if(generacion == null){//si la generacion esta vacia
                query += ' WHERE Tipo__c INCLUDES (:tipo) AND Name LIKE :searchTerm';//voy a buscar por tipo y por nombre
            }
            else if(String.isBlank(tipo)){//si el tipo esta vacio
                query += ' WHERE Generation__c = :generacion AND Name LIKE :searchTerm ';//busco por generacion y por nombre
            }
            else{ //busco por todos los tres terminos de filtrados
              query += ' WHERE Tipo__c INCLUDES(:tipo) AND Name LIKE :searchTerm AND Generation__c = :generacion';//y obtengo el tipo, el nombre y la generacion segun el filtro
             
            }
            query +=' ORDER BY PokeIndex__c';
          
    
            return Database.query(query);
    
            
        }
    }
    