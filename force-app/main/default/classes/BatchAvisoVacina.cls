public class BatchAvisoVacina implements Database.Batchable<SObject>{
    
    public Integer registrosProcessados = 0;

    public static Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Name, Pet__c, Contact__c FROM Adocao__c]);
    }

    public void execute(Database.BatchableContext bc, List<Adocao__c> adocao){
        
        Contact dono = new Contact();
        Pet__c pet = new Pet__c();
        HistoricoVacinacao__c histVac = new HistoricoVacinacao__c();

        for(Adocao__c ad : adocao){
            dono = ContactDAO.getContactById(ad.Contact__c);
            pet = PetDAO.getPet(ad.Pet__c);
            histVac = PetDAO.getDataVac(ad.Pet__c);

            if(pet.DataProximaVacinacao__c != null && pet.DataProximaVacinacao__c < System.today())
                if(histVac.DataVacinacao__c == null || histVac.DataVacinacao__c < pet.DataProximaVacinacao__c){
                    Task tarefa = new Task();

                    if(dono != null){
                        tarefa.Contact__c = dono.Id;
                        tarefa.Status = 'In Progress';
                        tarefa.Subject = 'Deve Vacinar o Pet!';
                        tarefa.Priority = 'High';

                        insert tarefa;

                        registrosProcessados++;
                    }
                }
        }
    }

    public void finish(Database.BatchableContext bc){
        System.debug('Registros processados: '+ registrosProcessados);
    }
}
