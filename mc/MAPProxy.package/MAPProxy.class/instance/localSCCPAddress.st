as yet unclassified
localSCCPAddress
	^ (SCCPAddress createForSSN: #vlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npISDN;
							addr: vlrNumber;
							translation: 0;
							yourself);
		yourself