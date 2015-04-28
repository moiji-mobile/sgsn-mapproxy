as yet unclassified
calledSCCPAddress: aGT
	logger logDebug: 'Creating called SCCPAddress' with: { 'gt' -> aGT }.
	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npMobile;
							addr: aGT;
							translation: 0;
							yourself);
		yourself