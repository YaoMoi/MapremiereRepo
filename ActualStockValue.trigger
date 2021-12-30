trigger ActualStockValue on Inventory__c (before insert, after update) {
    
    //We create a list of stock by assigning the result of a query.
    List<Inventory__c> InventoryLists = [SELECT Product_Name__c FROM Inventory__c WHERE Actual1_Stock__c < 10];
      List<Order1__c> OrderList = new List<Order1__c> ();
    for (Inventory__c inv : Trigger.new){
        if(inv.Actual1_Stock__c < 10){
           //we are going to generate a request to restock.
           Order1__c OrderA = new Order1__c();
            OrderA.Status__c ='Activated';
         //   OrderA.Product_Name__c = inv.Product_Name__c;
           OrderList.add(OrderA);
        }
    }
    insert OrderList;
 
}