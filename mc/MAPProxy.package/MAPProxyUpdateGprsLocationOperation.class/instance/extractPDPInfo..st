as yet unclassified
extractPDPInfo: anArgument
	| gprsSubscriptionData |
	gprsSubscriptionData := anArgument gprsSubscriptionData.
	gprsSubscriptionData ifNil: [^self].

	pdpInfoComplete := gprsSubscriptionData completeDataListIncluded isNil not.
	gprsSubscriptionData gprsDataList elements do: [:each |
		| pdp |
		pdp := MAPProxyPDPInfo new.
		pdp
			contextId: each pdp_ContextId;
			type: each pdp_Type;
			apn: each apn.
		pdpInfos add: pdp].