/**
 * @Descrição               : 
 * @Autor                   : 
 * @Empresa:                : Everymind LTDA.
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/

public class ImagemDAO {
    
    public static List<ContentDocumentLink> getLinkDocumento(Id idPai){

        return [
            SELECT 
                Id,
                ContentDocumentId,
                LinkedEntityId

            FROM ContentDocumentLink

            WHERE  
                LinkedEntityId = :idPai
        ];
    }

    public static ContentVersion getCV(List<Id> listId){

        return [
            SELECT
                Id, 
                Title, 
                ContentDocumentId
            FROM 
                ContentVersion
            WHERE 
                ContentDocumentId IN :listId
            LIMIT 1
        ];
    }

    public static ContentDistribution getCD(ContentDistribution cd){

        return [
            SELECT 
                DistributionPublicUrl, 
                ContentDownloadUrl 
            FROM 
                ContentDistribution 
            WHERE 
                Id = :cd.Id 
            LIMIT 1
        ];
    }
}
