/** 
 * @Descrição               : Query que retorna o email da org e template de email
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
public class EmailDAO {
    
    public static OrgWideEmailAddress getIdEmailOrg(String email){
        
        return [
            SELECT 
                Id,
                DisplayName
            FROM 
                OrgWideEmailAddress 
            WHERE 
                Address = :email 
            LIMIT 1
        ];
    }

    public static EmailTemplate getIdEmailTemplate(String nomeModelo){

        return [
            SELECT 
                Id, 
                Name,
                htmlValue,
                Subject
            FROM 
                EmailTemplate
            WHERE 
                Name = :nomeModelo
            LIMIT 1
        ];
    } 
}