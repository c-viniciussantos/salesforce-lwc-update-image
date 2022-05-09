/**
 * @Descrição               : Salvar e Editar a imagem do Pet
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
public inherited sharing class UploadImageCTRL {
    
    @AuraEnabled
    public static ContentVersion saveFile(Id idParent, String strFileName, String base64Data) {

        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        ContentVersion cv = new ContentVersion();
        cv.Title = strFileName;
        cv.PathOnClient = '/' + strFileName;
        cv.FirstPublishLocationId = idParent;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.IsMajorVersion = true;
        Insert cv;
        return cv;
    }

    @AuraEnabled
    public static String releatedFiles(Id idParent){
        List<id> lstConDocs = new List<id>();
        Pet__c pet = new Pet__c();
        for(ContentDocumentLink cntLink : [Select Id, ContentDocumentId From ContentDocumentLink Where LinkedEntityId =:idParent]) {
            lstConDocs.add(cntLink.ContentDocumentId);
        }
        if(!lstConDocs.isEmpty()) {
            ContentDistribution cdl = new ContentDistribution();
            ContentVersion cv = ImagemDAO.getCV(lstConDocs);
             
            cdl.ContentVersionId = cv.Id;
            cdl.Name = 'PublicShare';
            insert cdl;

            ContentDistribution cd = ImagemDAO.getCD(cdl);
            pet.Id = idParent;
            pet.Imagem__c = cd.ContentDownloadUrl;
            update pet;

            return cd.ContentDownloadUrl;
        }
        else {
            return null;
        }
     
    }
    
}