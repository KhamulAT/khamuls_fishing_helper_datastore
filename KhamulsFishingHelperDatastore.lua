-- initialize namespace
KhamulsFishingHelperDatastore = KhamulsFishingHelperDatastore or {}

-- initialize datastores
if not KhamulsFishingHelperDatastoreDB then 
	KhamulsFishingHelperDatastoreDB = {}
end

if not KhamulsFishingHelperDatastoreCharDB then
	KhamulsFishingHelperDatastoreCharDB = {}
end

function KhamulsFishingHelperDatastore.AddFishItemIdToDatastore(itemID)
	local parsedItemID = tonumber(itemID)
	if parsedItemID == nil then 
		return false
	end
	if not KhamulsFishingHelperDatastoreDB[parsedItemID] then
		KhamulsFishingHelperDatastoreDB[parsedItemID] = 0
	end
	
	if not KhamulsFishingHelperDatastoreCharDB[parsedItemID] then
		KhamulsFishingHelperDatastoreCharDB[parsedItemID] = 0
	end
	
	return true
end

function KhamulsFishingHelperDatastore.AddCaugthAmountToDatastore(itemID, amount)
	-- make sure amount and itemID is a number
	local parsedItemID = tonumber(itemID)
	local parsedAmount = tonumber(amount)
	
	if parsedItemID == nil or parsedAmount == nil then
		return false
	end
	
	-- add the itemID to datastore if it does not exist
	local itemIdAddedOrExists = KhamulsFishingHelperDatastore.AddFishItemIdToDatastore(parsedItemID)
	
	if not itemIdAddedOrExists then
		return false
	end
	
	-- add the amount to the count
	KhamulsFishingHelperDatastoreDB[parsedItemID] = KhamulsFishingHelperDatastoreDB[parsedItemID] + parsedAmount
	KhamulsFishingHelperDatastoreCharDB[parsedItemID] = KhamulsFishingHelperDatastoreCharDB[parsedItemID] + parsedAmount
end

function KhamulsFishingHelperDatastore.GetCaughtCounterForItemId(itemID)

	local parsedItemID = tonumber(itemID)
	
	if parsedItemID == nil then 
		return 0
	end
	
	local characterCount = KhamulsFishingHelperDatastoreCharDB[parsedItemID]
	local accountCount = KhamulsFishingHelperDatastoreDB[parsedItemID]

	return characterCount, accountCount
end