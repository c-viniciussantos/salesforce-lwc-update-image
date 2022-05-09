/**
 * @Descrição               : Data Access Object, busca no banco de dados do objeto Contato
 * @Autor                   : C. Vinícius Santos (c.viniciussantos@outlook.com)
 * @Ultima modificação em   : 08-05-2022
 * @Ultima modificação por  : C. Vinícius Santos (c.viniciussantos@outlook.com)
**/
public class ContactDAO {
    
    public static Contact getContactById(Id contato){
        return [
                SELECT 
                    Id,
                    FirstName,
                    LastName,
                    Name,
                    Email
                FROM
                    Contact
                WHERE
                    Id = :contato
        ];
    }
}