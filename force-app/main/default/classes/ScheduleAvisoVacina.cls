global  class ScheduleAvisoVacina implements Schedulable{
    
    global void execute(SchedulableContext ctx) {   

        BatchAvisoVacina bat = new BatchAvisoVacina();
        Database.executeBatch(bat);
    }   
}
