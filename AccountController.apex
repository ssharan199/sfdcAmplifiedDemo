public class AccountController {
     
    @auraEnabled
    public static List<Account> getAccounts(){
        
        List<Account> myacc = new List<Account>();
        
        
        myacc=[select id,name,description from Account order by createdDate asc];
        return myacc; 
    }
    @auraEnabled
    public static list<Account> filteredAccount(String selectfield, String selectcondition, String value){
        List<Account> myaccs = new List<Account>();
        if(selectcondition == 'Equals to'){
        
        string querystring='select id,name,phone,AnnualRevenue,Description,Fax,Website,NumberofEmployees from Account where '+ selectfield +'='+'\''+value+'\''; 
        myaccs = Database.query(querystring);
        }if(selectcondition == 'Not Equals to'){
            string querystring='select id,name,phone,AnnualRevenue,Description,Fax,Website,NumberofEmployees from Account where '+ selectfield +'!='+'\''+value+'\'';
        myaccs = Database.query(querystring);
        }if(selectcondition == 'contains'){
            string querystring='select id,name,phone,AnnualRevenue,Description,Fax,Website,NumberofEmployees from Account where '+ selectfield +' like'+'\'%'+value+'%\'';
        //yaccs=[select id,name,phone,AnnualRevenue,Description,Fax,Website,NumberOfEmployees from Account where :selectfield =:value];
        system.debug('querystring' +querystring);
        //List<Account> 
        myaccs = Database.query(querystring);
            
        }
        return myaccs; 
        
    }
    

}
