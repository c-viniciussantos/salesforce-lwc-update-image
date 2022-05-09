/**
 * @Descrição               : Controller para salvar e editar imagem
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
public class ImagemController {
    
    @AuraEnabled
    public static ContentVersion salvaImagem(Id idPai, String nomeImagem, String dados){
        try {
            
            ContentVersion cv = new ContentVersion();

            dados = EncodingUtil.urlDecode(dados, 'UTF-8');

            cv.Title = nomeImagem;
            cv.IsMajorVersion = true;
            cv.VersionData = EncodingUtil.base64Decode(dados);
            cv.FirstPublishLocationId = idPai;
            cv.PathOnClient = '/' + nomeImagem;

            insert cv;
            return cv;
            

        } catch (Exception e) {
            throw new AuraHandledException('Mensagem >>>'+ e.getMessage() +'Linha >>>>'+ e.getLineNumber());
        }
    }

    @AuraEnabled
    public static String arquivoRelacionado(Id idPai){
        try {
            
            List<Id> listId = new List<Id>();
            List<ContentDocumentLink> listCDL = ImagemDAO.getLinkDocumento(idPai);

            if(!listCDL.isEmpty())
                for(ContentDocumentLink cdl : listCDL){
                    listId.add(cdl.ContentDocumentId);
                }

            if(!listId.isEmpty()){

                ContentDistribution cd = new ContentDistribution();
                ContentDistribution cdu = new ContentDistribution();
                Pet__c pet = new Pet__c();

                ContentVersion cv = ImagemDAO.getCV(listId);

                cd.ContentVersion = cv;
                cd.Name = 'PublicShare';
                insert cd;

                pet.id = idPai;
                pet.Name = 'ImagemPublica';
                cdu = ImagemDAO.getCD(cd);
                pet.Imagem__c = cdu.ContentDownloadUrl;
                update pet;

                return cdu.ContentDownloadUrl;
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException('Mensagem >>>'+ e.getMessage() +'Linha >>>>'+ e.getLineNumber());
        }
    }
}
