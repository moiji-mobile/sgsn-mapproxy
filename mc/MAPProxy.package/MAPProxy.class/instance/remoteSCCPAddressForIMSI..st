as yet unclassified
remoteSCCPAddressForIMSI: anIMSI
	| gt |
	gt := (self gtForIMSI: anIMSI) prepare: anIMSI.

	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npMobile;
							addr: gt;
							translation: 0;
							yourself);
		yourself