public with sharing class CheckOcrOnOpportunity {

	// define variables
	List<Opportunity> newList;
	Map<Id,Opportunity> newMap;
	List<Opportunity> oldList;
	Map<Id,Opportunity> oldMap;

	// constructor that will create an object from the class

	public CheckOcrOnOpportunity(List<Opportunity> newList, Map<Id,Opportunity> newMap,List<Opportunity> oldList,Map<Id,Opportunity> oldMap){
		this.newList = newList;
		this.oldMap = oldMap;
		this.newMap = newMap;
		this.oldList = oldList;
	}

	public static void checkOcr(List<Opportunity> newList,Map<Id,Opportunity> newMap, List<Opportunity> oldList,Map<Id,Opportunity> oldMap){
		// identify the records which have to be processed
		Map<Id,List<OpportunityContactRole>> opOcrMap = new Map<Id,List<OpportunityContactRole>>();
		for(List<OpportunityContactRole> ocrList : [Select Id,OpportunityId,ContactId from OpportunityContactRole where OpportunityId IN: newMap.KeySet()]){
			for(OpportunityContactRole ocr : ocrList){
				if(opOcrMap.containsKey(ocr.OpportunityId)){
					opOcrMap.get(ocr.OpportunityId).add(ocr);
				}
				else
				{
					List<OpportunityContactRole> ocrList1 = new List<OpportunityContactRole>();
					ocrList1.add(ocr);
					opOcrMap.put(ocr.OpportunityId,ocrList1);
				}
			}
		}
		Set<Id> ocrSetId = new Set<Id>();
		for(Opportunity o : newMap.values()){
			List<OpportunityContactRole> ocr = opOcrMap.get(o.Id);
			if(ocr == null)
			{
				o.AddError('No OCR');
			}
			}
		}
	}