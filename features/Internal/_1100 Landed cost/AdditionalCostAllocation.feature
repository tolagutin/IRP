﻿#language: en
@tree
@AdditionalCostAllocation

Feature: Additional cost allocation


Background:
	Given I open new TestClient session or connect the existing one


Scenario: _041 test data
	When set True value to the constant (LC)
	* Checking the availability of catalogs and batches registers
		Given I open hyperlink "e1cib/list/Catalog.BatchKeys"
		Given I open hyperlink "e1cib/list/Catalog.Batches"
		Given I open hyperlink "e1cib/list/InformationRegister.T6020S_BatchKeysInfo"
		Given I open hyperlink "e1cib/list/InformationRegister.T6010S_BatchesInfo"
		Given I open hyperlink "e1cib/list/AccumulationRegister.R6010B_BatchWiseBalance"
		Given I open hyperlink "e1cib/list/AccumulationRegister.R6040T_BatchShortageIncoming"
		Given I open hyperlink "e1cib/list/AccumulationRegister.R6030T_BatchShortageOutgoing"
		And I close all client application windows
	* Load data
		When Create catalog AddAttributeAndPropertySets objects (LC)
		When Create catalog CancelReturnReasons objects (LC)
		When Create catalog AddAttributeAndPropertyValues objects (LC)
		When Create catalog IDInfoAddresses objects (LC)
		When Create catalog BusinessUnits objects (LC)
		When Create catalog Companies objects (LC)
		When Create catalog ConfigurationMetadata objects (LC)
		When Create catalog Countries objects (LC)
		When Create catalog Currencies objects (LC)
		When Create catalog ExpenseAndRevenueTypes objects (LC)
		When Create catalog IntegrationSettings objects (LC)
		When Create catalog ItemKeys objects (LC)
		When Create catalog ItemSegments objects (LC)
		When Create catalog SerialLotNumbers objects (LC)
		When Create catalog ItemTypes objects (LC)
		When Create catalog Units objects (LC)
		When Create catalog Items objects (LC)
		When Create catalog CurrencyMovementSets objects (LC)
		When Create catalog ObjectStatuses objects (LC)
		When Create catalog PartnerSegments objects (LC)
		When Create catalog Agreements objects (LC)
		When Create catalog Partners objects (LC)
		When Create catalog ExternalDataProc objects (LC)
		When Create catalog PriceKeys objects (LC)
		When Create catalog PriceTypes objects (LC)
		When Create catalog Specifications objects (LC)
		When Create catalog Stores objects (LC)
		When Create catalog TaxAnalytics objects (LC)
		When Create catalog TaxRates objects (LC)
		When Create catalog Taxes objects (LC)
		When Create catalog InterfaceGroups objects (LC)
		When Create catalog AccessGroups objects (LC)
		When Create catalog AccessProfiles objects (LC)
		When Create catalog UserGroups objects (LC)
		When Create catalog Users objects (LC)
		When Create document PriceList objects (LC)
		When Create chart of characteristic types AddAttributeAndProperty objects (LC)
		When Create chart of characteristic types CustomUserSettings objects (LC)
		When Create chart of characteristic types CurrencyMovementType objects (LC)
		When Create information register Taxes records (LC)
		When Create information register CurrencyRates records (LC)
		When Create information register Barcodes records (LC)
		When Create information register PricesByItemKeys records (LC)
		When Create information register PricesByItems records (LC)
		When Create information register PricesByProperties records (LC)
		When Create information register TaxSettings records (LC)
		When Create information register UserSettings records (LC)
		And Delay 10
		When update ItemKeys (LC)
	* Add plugin for taxes calculation
			When add Plugin for tax calculation (LC)
		When update tax settings (LC)

	* Landed cost currency movement type for company
		
		Given I open hyperlink "e1cib/list/Catalog.Companies"
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I select "Company" exact value from the drop-down list named "Type"
		And I move to "External attributes" tab
		And I click Select button of "Landed cost currency movement type" field
		And I go to line in "List" table
			| 'Currency' | 'Deferred calculation' | 'Description'    | 'Reference'      | 'Source'       | 'Type'  |
			| 'TRY'      | 'No'                   | 'Local currency' | 'Local currency' | 'Forex Seling' | 'Legal' |
		And I select current line in "List" table
		And I click "Save and close" button
		And I wait "Main Company (Company) *" window closing in 20 seconds
		Then "Companies" window is opened
		And I go to line in "List" table
			| 'Description'    |
			| 'Second Company' |
		And I select current line in "List" table
		And I select "Company" exact value from the drop-down list named "Type"
		And I move to "External attributes" tab
		And I click Select button of "Landed cost currency movement type" field
		And I go to line in "List" table
			| 'Currency' | 'Deferred calculation' | 'Description'        | 'Reference'          | 'Source'       | 'Type'      |
			| 'USD'      | 'No'                   | 'Reporting currency' | 'Reporting currency' | 'Forex Seling' | 'Reporting' |
		And I go to line in "List" table
			| 'Currency' | 'Deferred calculation' | 'Description'    | 'Reference'      | 'Source'       | 'Type'  |
			| 'TRY'      | 'No'                   | 'Local currency' | 'Local currency' | 'Forex Seling' | 'Legal' |
		And I select current line in "List" table
		And I click "Save and close" button
		And I wait "Second Company (Company) *" window closing in 20 seconds
	* Load documents
		When Create catalog RowIDs objects (LC)
		And Delay 10
		When Create document Bundling objects (LC)
		When Create document GoodsReceipt objects (LC)
		When Create document PurchaseInvoice objects (for AdditionalCostAllocation) (LC)
		When Create document InventoryTransfer objects (LC)
		When Create document OpeningEntry objects (LC)
		When Create document PriceList objects (LC)
		When Create document AdditionalCostAllocation objects (by documents, amount, quantity, weight) (LC)
		When Create document PurchaseInvoice objects (LC)
		When Create document PurchaseOrder objects (LC)
		When Create document PurchaseReturn objects (LC)
		When Create document PurchaseReturnOrder objects (LC)
		When Create document SalesInvoice objects (LC)
		When Create document SalesReturn objects (LC)
		When Create document SalesReturnOrder objects (LC)
		When Create document ShipmentConfirmation objects (LC)
		When Create document StockAdjustmentAsSurplus objects (LC)
		When Create document StockAdjustmentAsWriteOff objects (LC)
		When Create document Unbundling objects (LC)
		When Create document StockAdjustmentAsWriteOff objects (LC)
		When Create document Unbundling objects (LC)
		When Create document RetailSalesReceipt objects (LC)
		When Create document AdditionalCostAllocation objects (by rows, amount) (LC)
		When Create document RetailReturnReceipt objects (LC)
		When Create document CalculationMovementCosts objects (LC)
	* Posting Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		Then "Purchase orders" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "10"
	* Posting Purchase invoice
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		Then "Purchase invoices" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "10"
	* Posting Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		Then "Sales invoices" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "10"
	* Posting Sales return order
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		Then "Sales return orders" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "10"
		And I close all client application windows
	* Posting Sales return
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		Then "Sales returns" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Purchase return order
		Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
		Then "Purchase return orders" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
		And I close all client application windows
	* Posting Purchase return
		Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
		Then "Purchase returns" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Goods receipt
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		Then "Goods receipts" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Shipment confirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		Then "Shipment confirmations" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "10"
	* Posting Stock adjustment as surplus
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsSurplus"
		Then "Stock adjustments as surplus" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Stock adjustment as write off
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsWriteOff"
		Then "Stock adjustments as write-off" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Bundling
		Given I open hyperlink "e1cib/list/Document.Bundling"
		Then "Bundling list" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Unbundling
		Given I open hyperlink "e1cib/list/Document.Unbundling"
		Then "Unbundling list" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Opening entry
		Given I open hyperlink "e1cib/list/Document.OpeningEntry"
		Then "Opening entries" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Inventory transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		Then "Inventory transfers" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Retail sales receipt
		Given I open hyperlink "e1cib/list/Document.RetailSalesReceipt"
		Then "Retail sales receipts" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Retail return receipt
		Given I open hyperlink "e1cib/list/Document.RetailReturnReceipt"
		Then "Retail return receipts" window is opened
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Additional cost allocation
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	* Posting Calculation movement costs
		Given I open hyperlink "e1cib/list/Document.CalculationMovementCosts"
		Then I select all lines of "List" table
		And in the table "List" I click the button named "ListContextMenuPost"
		And Delay "5"
	And I close all client application windows

Scenario: _042 check additional cost allocation (documents, by quantity)
	Given I open hyperlink "e1cib/app/Report.BatchBalance"
	And I click "Change option..." button
	And I move to "Fields" tab
	And I move to the tab named "FilterPage"
	And I go to line in "SettingsComposerSettingsFilter" table
		| 'Application'  | 'Comparison type' | 'Display mode' | 'Left value' | 'Use' |
		| 'No hierarchy' | 'Filled'          | 'Disabled'     | 'Recorder'   | 'Yes' |
	And I activate "Comparison type" field in "SettingsComposerSettingsFilter" table
	And I select current line in "SettingsComposerSettingsFilter" table
	And I select "Equal to" exact value from "Comparison type" drop-down list in "SettingsComposerSettingsFilter" table
	And I activate field named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I click choice button of the attribute named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I go to line in "" table
		| ''                 |
		| 'Purchase invoice' |
	And I select current line in "" table
	And I go to line in "List" table
		| 'Amount'    | 'Company'      | 'Currency' | 'Date'                | 'Legal name'        | 'Number' | 'Partner'   | 'Reference'                                    |
		| '16 560,00' | 'Main Company' | 'TRY'      | '14.08.2021 12:00:00' | 'Company Ferron BP' | '2'      | 'Ferron BP' | 'Purchase invoice 2 dated 14.08.2021 12:00:00' |
	And I activate field named "Date" in "List" table
	And I select current line in "List" table
	And I finish line editing in "SettingsComposerSettingsFilter" table
	And I click "Finish editing" button
	And I click "Run report" button
	And "Result" spreadsheet document contains "BathBalance_042_1" template lines by template
	And I close all client application windows
	
	
Scenario: _043 check additional cost allocation (documents, by amount)
	And I close all client application windows
	Given I open hyperlink "e1cib/app/Report.BatchBalance"
	And I click "Change option..." button
	And I move to "Fields" tab
	And I move to the tab named "FilterPage"
	And I go to line in "SettingsComposerSettingsFilter" table
		| 'Application'  | 'Comparison type' | 'Display mode' | 'Left value' | 'Use' |
		| 'No hierarchy' | 'Filled'          | 'Disabled'     | 'Recorder'   | 'Yes' |
	And I activate "Comparison type" field in "SettingsComposerSettingsFilter" table
	And I select current line in "SettingsComposerSettingsFilter" table
	And I select "Equal to" exact value from "Comparison type" drop-down list in "SettingsComposerSettingsFilter" table
	And I activate field named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I click choice button of the attribute named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I go to line in "" table
		| ''                 |
		| 'Purchase invoice' |
	And I select current line in "" table
	And I go to line in "List" table
		| 'Amount'     | 'Company'      | 'Currency' | 'Date'                | 'Legal name' | 'Number' | 'Partner' | 'Reference'                                    |
		| '104 241,20' | 'Main Company' | 'TRY'      | '13.08.2021 16:52:30' | 'DFC'        | '3'      | 'DFC'     | 'Purchase invoice 3 dated 13.08.2021 16:52:30' |
	And I activate field named "Date" in "List" table
	And I select current line in "List" table
	And I finish line editing in "SettingsComposerSettingsFilter" table
	And I click "Finish editing" button
	And I click "Run report" button
	And "Result" spreadsheet document contains "BathBalance_043_1" template lines by template
	And I close all client application windows

Scenario: _044 check additional cost allocation (documents, by weight)
	And I close all client application windows
	Given I open hyperlink "e1cib/app/Report.BatchBalance"
	And I click "Change option..." button
	And I move to "Fields" tab
	And I move to the tab named "FilterPage"
	And I go to line in "SettingsComposerSettingsFilter" table
		| 'Application'  | 'Comparison type' | 'Display mode' | 'Left value' | 'Use' |
		| 'No hierarchy' | 'Filled'          | 'Disabled'     | 'Recorder'   | 'Yes' |
	And I activate "Comparison type" field in "SettingsComposerSettingsFilter" table
	And I select current line in "SettingsComposerSettingsFilter" table
	And I select "Equal to" exact value from "Comparison type" drop-down list in "SettingsComposerSettingsFilter" table
	And I activate field named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I click choice button of the attribute named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I go to line in "" table
		| ''                 |
		| 'Purchase invoice' |
	And I select current line in "" table
	And I go to line in "List" table
		| 'Number' |
		| '4'      |
	And I activate field named "Date" in "List" table
	And I select current line in "List" table
	And I finish line editing in "SettingsComposerSettingsFilter" table
	And I click "Finish editing" button
	And I click "Run report" button
	And "Result" spreadsheet document contains "BathBalance_044_1" template lines by template
	And I close all client application windows	
		
Scenario: _045 check additional cost allocation (rows, by amount)
	And I close all client application windows
	Given I open hyperlink "e1cib/app/Report.BatchBalance"
	And I click "Change option..." button
	And I move to "Fields" tab
	And I move to the tab named "FilterPage"
	And I go to line in "SettingsComposerSettingsFilter" table
		| 'Application'  | 'Comparison type' | 'Display mode' | 'Left value' | 'Use' |
		| 'No hierarchy' | 'Filled'          | 'Disabled'     | 'Recorder'   | 'Yes' |
	And I activate "Comparison type" field in "SettingsComposerSettingsFilter" table
	And I select current line in "SettingsComposerSettingsFilter" table
	And I select "In list" exact value from "Comparison type" drop-down list in "SettingsComposerSettingsFilter" table
	And I activate field named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I click choice button of the attribute named "SettingsComposerSettingsFilterRightValue" in "SettingsComposerSettingsFilter" table
	And I click the button named "Add"
	And I click choice button of the attribute named "Value" in "ValueList" table
	And I go to line in "" table
		| ''                 |
		| 'Purchase invoice' |
	And I select current line in "" table
	And I go to line in "List" table
		| 'Amount'    | 'Company'      | 'Currency' | 'Date'                | 'Legal name'        | 'Number' | 'Partner'   | 'Reference'                                    |
		| '19 700,00' | 'Main Company' | 'USD'      | '15.08.2021 16:56:10' | 'Company Ferron BP' | '5'      | 'Ferron BP' | 'Purchase invoice 5 dated 15.08.2021 16:56:10' |
	And I select current line in "List" table
	And I finish line editing in "ValueList" table
	And I click the button named "Add"
	And I click choice button of the attribute named "Value" in "ValueList" table
	And I go to line in "" table
		| ''                 |
		| 'Purchase invoice' |
	And I select current line in "" table
	And I go to line in "List" table
		| 'Amount'     | 'Company'      | 'Currency' | 'Date'                | 'Legal name' | 'Number' | 'Partner' | 'Reference'                                    |
		| '839 233,70' | 'Main Company' | 'TRY'      | '15.08.2021 16:56:11' | 'DFC'        | '6'      | 'DFC'     | 'Purchase invoice 6 dated 15.08.2021 16:56:11' |
	And I select current line in "List" table
	And I finish line editing in "ValueList" table
	And I click the button named "OK"
	And I finish line editing in "SettingsComposerSettingsFilter" table
	And I click "Finish editing" button
	And I click "Run report" button
	And "Result" spreadsheet document contains "BathBalance_045_1" template lines by template
	And I close all client application windows	

Scenario: _048 create additional cost allocation (documents, by quantity)
	* Open additional cost allocation form
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And I click the button named "FormCreate"
	* Filling document
		And I click Choice button of the field named "Company"
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I select "By documents" exact value from "Allocation mode" drop-down list
		And I select "By quantity" exact value from "Allocation method" drop-down list
		And in the table "CostDocuments" I click "Add" button
		And I click choice button of "Document" attribute in "CostDocuments" table
		And "List" table became equal
			| 'Basis'                                            | 'Company'      | 'Amount' | 'Currency' |
			| 'Purchase invoice 9 017 dated 05.06.2022 13:25:04' | 'Main Company' | '350'    | 'TRY'      |
			| 'Purchase invoice 9 015 dated 01.06.2022 13:20:23' | 'Main Company' | '400'    | 'TRY'      |
			| 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' | 'Main Company' | '350'    | 'TRY'      |
			| 'Purchase invoice 9 018 dated 09.06.2022 13:56:02' | 'Main Company' | '350'    | 'TRY'      |
			| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'Main Company' | '650'    | 'TRY'      |
			| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'Main Company' | '550'    | 'TRY'      |
		And I go to line in "List" table
			| 'Basis'                                            | 'Company'      | 'Amount' | 'Currency' |
			| 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' | 'Main Company' | '350'    | 'TRY'      |
		And I select current line in "List" table
		And I finish line editing in "CostDocuments" table
		And in the table "AllocationDocuments" I click the button named "AllocationDocumentsAdd"
		And I select current line in "AllocationDocuments" table
		And I click choice button of the attribute named "AllocationDocumentsDocument" in "AllocationDocuments" table
		And I go to line in "List" table
			| 'Basis'                                        | 'Company'      |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Main Company' |
		And I select current line in "List" table
		And I finish line editing in "AllocationDocuments" table
	* Check filling
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "AllocationMode" became equal to "By documents"
		Then the form attribute named "AllocationMethod" became equal to "By quantity"
		And "CostDocuments" table became equal
			| '#' | 'Document'                                         | 'Amount' | 'Currency' |
			| '1' | 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' | '350,00' | 'TRY'      |
		And "AllocationDocuments" table became equal
			| 'Document'                                     |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' |
	* Add one more cost document
		And in the table "CostDocuments" I click "Add" button
		And I click choice button of "Document" attribute in "CostDocuments" table
		And "List" table became equal
			| 'Basis'                                            | 'Company'      | 'Amount' | 'Currency' |
			| 'Purchase invoice 9 017 dated 05.06.2022 13:25:04' | 'Main Company' | '350'    | 'TRY'      |
			| 'Purchase invoice 9 015 dated 01.06.2022 13:20:23' | 'Main Company' | '400'    | 'TRY'      |
			| 'Purchase invoice 9 018 dated 09.06.2022 13:56:02' | 'Main Company' | '350'    | 'TRY'      |
			| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'Main Company' | '650'    | 'TRY'      |
			| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'Main Company' | '550'    | 'TRY'      |
		And I go to line in "List" table
			| 'Amount' | 'Basis'                                            | 'Company'      | 'Currency' |
			| '400'    | 'Purchase invoice 9 015 dated 01.06.2022 13:20:23' | 'Main Company' | 'TRY'      |
		And I select current line in "List" table
		And I finish line editing in "CostDocuments" table
	* Add one more allocation document
		And in the table "AllocationDocuments" I click the button named "AllocationDocumentsAdd"
		And I select current line in "AllocationDocuments" table
		And I click choice button of the attribute named "AllocationDocumentsDocument" in "AllocationDocuments" table
		And I go to line in "List" table
			| 'Basis'                                        | 'Company'      |
			| 'Purchase invoice 3 dated 13.08.2021 16:52:30' | 'Main Company' |
		And I select current line in "List" table
		And I finish line editing in "AllocationDocuments" table
	* Delete string
		And I go to line in "CostDocuments" table
			| '#' | 'Amount' | 'Currency' | 'Document'                                         |
			| '1' | '350,00' | 'TRY'      | 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' |
		And I delete a line in "CostDocuments" table
		And "CostDocuments" table became equal
			| '#' | 'Document'                                         | 'Amount' | 'Currency' |
			| '1' | 'Purchase invoice 9 015 dated 01.06.2022 13:20:23' | '400,00' | 'TRY'      |
		And "AllocationDocuments" table became equal
			| 'Document'                                     |
			| 'Purchase invoice 3 dated 13.08.2021 16:52:30' |
		And I click the button named "FormPost"
		And I delete "$$AdditionalCostAllocationDocumentsByQuantity$$" variable
		And I delete "$$NumberAdditionalCostAllocationDocumentsByQuantity$$" variable
		And I save the window as "$$AdditionalCostAllocationDocumentsByQuantity$$"
		And I save the value of "Number" field as "$$NumberAdditionalCostAllocationDocumentsByQuantity$$"
		And I click the button named "FormPostAndClose"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And "List" table contains lines
			| 'Number'                |
			| '$$NumberAdditionalCostAllocationDocumentsByQuantity$$' |
		And I close all client application windows
				

Scenario: _049 create additional cost allocation (documents, By amount)
	* Open additional cost allocation form
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And I click the button named "FormCreate"
	* Filling document
		And I click Choice button of the field named "Company"
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I select "By documents" exact value from "Allocation mode" drop-down list
		And I select "By amount" exact value from "Allocation method" drop-down list
		And in the table "CostDocuments" I click "Add" button
		And I click choice button of "Document" attribute in "CostDocuments" table	
		And I go to line in "List" table
			| 'Basis'                                            | 'Company'      | 'Amount' | 'Currency' |
			| 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' | 'Main Company' | '350'    | 'TRY'      |
		And I select current line in "List" table
		And I finish line editing in "CostDocuments" table
		And in the table "AllocationDocuments" I click the button named "AllocationDocumentsAdd"
		And I select current line in "AllocationDocuments" table
		And I click choice button of the attribute named "AllocationDocumentsDocument" in "AllocationDocuments" table
		And I go to line in "List" table
			| 'Basis'                                        | 'Company'      |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Main Company' |
		And I select current line in "List" table
		And I finish line editing in "AllocationDocuments" table
	* Check filling
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "AllocationMode" became equal to "By documents"
		Then the form attribute named "AllocationMethod" became equal to "By amount"
		And "CostDocuments" table became equal
			| '#' | 'Document'                                         | 'Amount' | 'Currency' |
			| '1' | 'Purchase invoice 9 016 dated 09.06.2022 13:21:30' | '350,00' | 'TRY'      |
		And "AllocationDocuments" table became equal
			| 'Document'                                     |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' |		
		And I click the button named "FormPost"
		And I delete "$$AdditionalCostAllocationDocumentsByAmount$$" variable
		And I delete "$$NumberAdditionalCostAllocationDocumentsByAmount$$" variable
		And I save the window as "$$AdditionalCostAllocationDocumentsByAmount$$"
		And I save the value of "Number" field as "$$NumberAdditionalCostAllocationDocumentsByAmount$$"
		And I click the button named "FormPostAndClose"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And "List" table contains lines
			| 'Number'                |
			| '$$NumberAdditionalCostAllocationDocumentsByAmount$$' |
		And I close all client application windows
				
Scenario: _050 create additional cost allocation (documents, By weight)
	* Open additional cost allocation form
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And I click the button named "FormCreate"
	* Filling document
		And I click Choice button of the field named "Company"
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I select "By documents" exact value from "Allocation mode" drop-down list
		And I select "By weight" exact value from "Allocation method" drop-down list
		And in the table "CostDocuments" I click "Add" button
		And I click choice button of "Document" attribute in "CostDocuments" table	
		And I go to line in "List" table
			| 'Basis'                                            | 'Company'      | 'Amount' | 'Currency' |
			| 'Purchase invoice 9 017 dated 05.06.2022 13:25:04' | 'Main Company' | '350'    | 'TRY'      |
		And I select current line in "List" table
		And I finish line editing in "CostDocuments" table
		And in the table "AllocationDocuments" I click the button named "AllocationDocumentsAdd"
		And I select current line in "AllocationDocuments" table
		And I click choice button of the attribute named "AllocationDocumentsDocument" in "AllocationDocuments" table
		And I go to line in "List" table
			| 'Basis'                                        | 'Company'      |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Main Company' |
		And I select current line in "List" table
		And I finish line editing in "AllocationDocuments" table
	* Check filling
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "AllocationMode" became equal to "By documents"
		Then the form attribute named "AllocationMethod" became equal to "By weight"
		And "CostDocuments" table became equal
			| '#' | 'Document'                                         | 'Amount' | 'Currency' |
			| '1' | 'Purchase invoice 9 017 dated 05.06.2022 13:25:04' | '350,00' | 'TRY'      |
		And "AllocationDocuments" table became equal
			| 'Document'                                     |
			| 'Purchase invoice 2 dated 14.08.2021 12:00:00' |		
		And I click the button named "FormPost"
		And I delete "$$AdditionalCostAllocationDocumentsByWeight$$" variable
		And I delete "$$NumberAdditionalCostAllocationDocumentsByWeight$$" variable
		And I save the window as "$$AdditionalCostAllocationDocumentsByWeight$$"
		And I save the value of "Number" field as "$$NumberAdditionalCostAllocationDocumentsByWeight$$"
		And I click the button named "FormPostAndClose"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And "List" table contains lines
			| 'Number'                |
			| '$$NumberAdditionalCostAllocationDocumentsByWeight$$' |
		And I close all client application windows		
				
Scenario: _051 create additional cost allocation (row, by amount)
	* Open additional cost allocation form
		And I close all client application windows
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And I click the button named "FormCreate"
	* Filling document
		And I click Choice button of the field named "Company"
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I select "By rows" exact value from "Allocation mode" drop-down list
		And I select "By amount" exact value from "Allocation method" drop-down list
		* Select cost
			And in the table "CostRows" I click "Select costs" button
			Then "Select cost rows" window is opened
			And "CostRowsTree" table became equal
				| 'Document'                                         | 'Use' | 'Amount' | 'Item'    | 'Item key' | 'Currency' |
				| 'Purchase invoice 9 018 dated 09.06.2022 13:56:02' | 'No'  | ''       | ''        | ''         | ''         |
				| 'Purchase invoice 9 018 dated 09.06.2022 13:56:02' | 'No'  | '150,00' | 'Service' | 'Rent'     | 'TRY'      |
				| 'Purchase invoice 9 018 dated 09.06.2022 13:56:02' | 'No'  | '200,00' | 'Service' | 'Interner' | 'TRY'      |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'No'  | ''       | ''        | ''         | ''         |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'No'  | '250,00' | 'Service' | 'Rent'     | 'TRY'      |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'No'  | '400,00' | 'Service' | 'Interner' | 'TRY'      |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'No'  | ''       | ''        | ''         | ''         |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'No'  | '400,00' | 'Service' | 'Interner' | 'TRY'      |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'No'  | '150,00' | 'Service' | 'Rent'     | 'TRY'      |
			And I go to line in "CostRowsTree" table
				| 'Amount' | 'Currency' | 'Document'                                         | 'Item'    | 'Item key' | 'Use' |
				| '250,00' | 'TRY'      | 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | 'Service' | 'Rent'     | 'No'  |
			And I activate "Item" field in "CostRowsTree" table
			And I change "Use" checkbox in "CostRowsTree" table
			And I finish line editing in "CostRowsTree" table
			And I go to line in "CostRowsTree" table
				| 'Amount' | 'Currency' | 'Document'                                         | 'Item'    | 'Item key' | 'Use' |
				| '150,00' | 'TRY'      | 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | 'Service' | 'Rent'     | 'No'  |
			And I change "Use" checkbox in "CostRowsTree" table
			And I finish line editing in "CostRowsTree" table
			And I click "Ok" button
			And "CostRows" table became equal
				| 'Document'                                         | 'Amount' | 'Item'    | 'Item key' | 'Currency' |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | ''       | ''        | ''         | ''         |
				| ''                                                 | '250,00' | 'Service' | 'Rent'     | 'TRY'      |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | ''       | ''        | ''         | ''         |
				| ''                                                 | '150,00' | 'Service' | 'Rent'     | 'TRY'      |
		* Select allocation
			And I go to line in "CostRows" table
				| 'Amount' | 'Currency' | 'Item'    | 'Item key' |
				| '250,00' | 'TRY'      | 'Service' | 'Rent'     |
			And in the table "AllocationRows" I click "Select allocations" button
			Then "Select allocation rows" window is opened
			And I go to line in "List" table
				| 'Company'      | 'Document'                                     |
				| 'Main Company' | 'Purchase invoice 2 dated 14.08.2021 12:00:00' |
			And I select current line in "List" table
			And I move to "Rows" tab
			And I go to line in "DocumentRows" table
				| 'Item'  | 'Item key' | 'Store'    | 'Use' |
				| 'Boots' | '37/18SD'  | 'Store 02' | 'No'  |
			And I set "Use" checkbox in "DocumentRows" table
			And I finish line editing in "DocumentRows" table
			And I go to line in "DocumentRows" table
				| 'Item'  | 'Item key' | 'Store'    | 'Use' |
				| 'Dress' | 'M/White'  | 'Store 02' | 'No'  |
			And I set "Use" checkbox in "DocumentRows" table
			And I finish line editing in "DocumentRows" table
			And in the table "DocumentRows" I click the button named "DocumentRowsEditorOk"
			And I move to "Results" tab
			And "ResultTree" table became equal
				| 'Document'                                     | 'Store'    | 'Item'  | 'Item key' |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | ''         | ''      | ''         |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Store 02' | 'Dress' | 'M/White'  |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Store 02' | 'Boots' | '37/18SD'  |
			And I move to the tab named "GroupPageRowEditor"
			And I go to line in "List" table
				| 'Company'      | 'Document'                                     |
				| 'Main Company' | 'Purchase invoice 3 dated 13.08.2021 16:52:30' |
			And I select current line in "List" table
			And I move to "Rows" tab
			And I go to line in "DocumentRows" table
				| 'Item' | 'Item key' | 'Store'    | 'Use' |
				| 'Bag'  | 'ODS'      | 'Store 02' | 'No'  |
			And I set "Use" checkbox in "DocumentRows" table
			And I finish line editing in "DocumentRows" table
			And in the table "DocumentRows" I click the button named "DocumentRowsEditorOk"
			And I move to "Results" tab
			And "ResultTree" table became equal
				| 'Document'                                     | 'Store'    | 'Item'  | 'Item key' |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | ''         | ''      | ''         |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Store 02' | 'Dress' | 'M/White'  |
				| 'Purchase invoice 2 dated 14.08.2021 12:00:00' | 'Store 02' | 'Boots' | '37/18SD'  |
				| 'Purchase invoice 3 dated 13.08.2021 16:52:30' | ''         | ''      | ''         |
				| 'Purchase invoice 3 dated 13.08.2021 16:52:30' | 'Store 02' | 'Bag'   | 'ODS'      |
			And I click "Ok" button
			And "CostRows" table became equal
				| 'Document'                                         | 'Amount' | 'Item'    | 'Item key' | 'Currency' |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | ''       | ''        | ''         | ''         |
				| ''                                                 | '250,00' | 'Service' | 'Rent'     | 'TRY'      |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | ''       | ''        | ''         | ''         |
				| ''                                                 | '150,00' | 'Service' | 'Rent'     | 'TRY'      |
		* Check cancel when select allocation
			And I go to line in "CostRows" table
				| 'Amount' | 'Currency' | 'Item'    | 'Item key' |
				| '150,00' | 'TRY'      | 'Service' | 'Rent'     |
			And in the table "AllocationRows" I click "Select allocations" button
			And I go to line in "List" table
				| 'Company'      | 'Document'                                     |
				| 'Main Company' | 'Purchase invoice 2 dated 14.08.2021 12:00:00' |
			And I select current line in "List" table
			And I move to "Rows" tab
			And I go to line in "DocumentRows" table
				| 'Item'  | 'Item key' | 'Store'    | 'Use' |
				| 'Boots' | '38/18SD'  | 'Store 02' | 'No'  |
			And I change "Use" checkbox in "DocumentRows" table
			And I finish line editing in "DocumentRows" table
			And in the table "DocumentRows" I click the button named "DocumentRowsEditorOk"
			And I click the button named "FormCancel"
			And "CostRows" table became equal
				| 'Document'                                         | 'Amount' | 'Item'    | 'Item key' | 'Currency' |
				| 'Purchase invoice 9 020 dated 09.06.2022 13:56:22' | ''       | ''        | ''         | ''         |
				| ''                                                 | '250,00' | 'Service' | 'Rent'     | 'TRY'      |
				| 'Purchase invoice 9 019 dated 09.06.2022 13:56:11' | ''       | ''        | ''         | ''         |
				| ''                                                 | '150,00' | 'Service' | 'Rent'     | 'TRY'      |
		* Allocate cost amount
			And in the table "AllocationRows" I click "Allocate cost Amount" button
			And I click the button named "FormPost"
			And I delete "$$AdditionalCostAllocationRowsByAmount$$" variable
			And I delete "$$NumberAdditionalCostAllocationRowsByAmount$$" variable
			And I save the window as "$$AdditionalCostAllocationRowsByAmount$$"
			And I save the value of "Number" field as "$$NumberAdditionalCostAllocationRowsByAmount$$"
			And I click the button named "FormPostAndClose"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.AdditionalCostAllocation"
		And "List" table contains lines
			| 'Number'                |
			| '$$NumberAdditionalCostAllocationRowsByAmount$$' |
		And I close all client application windows		
						
			
						
			
			
						
						
			
						
						
			
			
						
			
							
			
						

		
				
		
				
		
				
		
					
				
		
				
		
		
				
		
				
		
				

		