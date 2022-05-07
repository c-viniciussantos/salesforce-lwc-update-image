trigger TriggerAdocao on Adocao__c (before insert, before update, after insert, after update){

	if(Trigger.isBefore) {
		if(Trigger.isInsert) {

		}else if(Trigger.isUpdate) {
            AdocaoBO.envioEmailAguardandoBuscaPet(Trigger.new);
		}
	}else if(Trigger.isAfter) {
		if(Trigger.isInsert) {
            
		}
		if(Trigger.isUpdate) {
			
		}
	}
}