as yet unclassified
callingSCCPAddress: aSSN
	^ (SCCPAddress createWith: aSSN)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: vlrNumber;
							translation: 0;
							yourself);
		yourself