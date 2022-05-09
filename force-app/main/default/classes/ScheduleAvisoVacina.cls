/**
 * @Descrição               : Agendar a execução do BatchAvisoVacina, ativado via Developer console
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
global  class ScheduleAvisoVacina implements Schedulable{
    
    global void execute(SchedulableContext ctx) {   

        BatchAvisoVacina bat = new BatchAvisoVacina();
        Database.executeBatch(bat);
    }   
}
