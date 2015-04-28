as yet unclassified
callingSCCPAddress: aSSN
	logger logDebug: 'Creating calling SCCP Address' with: { 'ssn' -> aSSN }.
	^ (SCCPAddress createWith: aSSN)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: vlrNumber;
							translation: 0;
							yourself);
		yourself