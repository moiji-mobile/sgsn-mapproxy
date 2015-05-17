as yet unclassified
calledHLRAddress: aGT 
	logger logDebug: 'Creating called SCCPAddress for hlr-Number' with: { 'gt' -> aGT }.
	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: aGT;
							translation: 0;
							yourself);
		yourself