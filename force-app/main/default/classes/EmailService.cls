/**
 * @Descrição               : Disparar um serviço de email customizado
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
public class EmailService {

    public static void enviarEmailBuscarPet(Contact contato){

        String emailRemetente = 'atendimento@adotepet.com.br';
        String emailDestinatario = contato.Email;

        //OrgWideEmailAddress emailEnvio = EmailDAO.getIdEmailOrg(emailRemetente);
        EmailTemplate modeloEmail = EmailDAO.getIdEmailTemplate('Email Aguardando Buscar Pet');

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setToAddresses(new List<String> {emailDestinatario});
        mail.setTemplateId(modeloEmail.Id);
        //mail.setOrgWideEmailAddressId(emailEnvio.Id);
        mail.setTargetObjectId(contato.Id);
        mail.setSaveAsActivity(false);
        mail.setBccSender(false);

        System.debug('Email cliente: '+ mail.getToAddresses());
        System.debug('Endereço de resposta: '+ mail.getInReplyTo());
        System.debug('Assunto: '+ mail.getSubject());
        System.debug('Id modelo de email: '+ mail.getTemplateId());
        System.debug('Endereço de envio'+ mail.getOrgWideEmailAddressId());

        Messaging.SendEmailResult[] resultado = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
        inspectResults(resultado);
    }

    private static Boolean inspectResults(Messaging.SendEmailResult[] resultado) {

        Boolean sendResult = true;
        
        for (Messaging.SendEmailResult res : resultado) {
            if (res.isSuccess()) {
                System.debug('Email enviado com sucesso');
            }
            else {
                sendResult = false;
                System.debug('Segue os erros ocorridos: ' + res.getErrors());                 
            }
        }
        
        return sendResult;
    }
}
