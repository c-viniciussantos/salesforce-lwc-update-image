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