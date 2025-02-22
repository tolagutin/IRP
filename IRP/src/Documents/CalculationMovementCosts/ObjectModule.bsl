
Procedure Posting(Cancel, PostingMode)
	AccumulationRegisters.R6020B_BatchBalance.BatchBalance_Clear(ThisObject.Ref, Cancel);
	AccumulationRegisters.R6060T_CostOfGoodsSold.CostOfGoodsSold_Clear(ThisObject.Ref, Cancel);
	AccumulationRegisters.R5022T_Expenses.Expenses_Clear(ThisObject.Ref, Cancel);
	LandedCostServer.Posting_BatchWiceBalance(ThisObject.Ref,
	                                       ThisObject.Company,
	                                       ThisObject.CalculationMode, 
	                                       ThisObject.BeginDate, 
	                                       ThisObject.EndDate);
	For Each Records In ThisObject.RegisterRecords Do
		Records.Read();
	EndDo;
EndProcedure

Procedure UndoPosting(Cancel)
	AccumulationRegisters.R6020B_BatchBalance.BatchBalance_Clear(ThisObject.Ref, Cancel);
	AccumulationRegisters.R6060T_CostOfGoodsSold.CostOfGoodsSold_Clear(ThisObject.Ref, Cancel);
	AccumulationRegisters.R5022T_Expenses.Expenses_Clear(ThisObject.Ref, Cancel);
	InformationRegisters.T6030S_BatchRelevance.BatchRelevance_Reset(ThisObject.Company, ThisObject.BeginDate);
	LandedCostServer.ReleaseBatchReallocateDocuments(ThisObject.Ref);
EndProcedure

Procedure FillCheckProcessing(Cancel, CheckedAttributes)
	If ThisObject.CalculationMode = Enums.CalculationMode.LandedCostBatchReallocate Then
		CheckedAttributes.Delete(CheckedAttributes.Find("Company"));
	EndIf;
EndProcedure
