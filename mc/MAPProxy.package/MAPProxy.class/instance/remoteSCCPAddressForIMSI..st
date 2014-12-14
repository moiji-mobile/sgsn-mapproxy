as yet unclassified
remoteSCCPAddressForIMSI: anIMSI
	| gt |
	"TODO: Generalize the map..."
	gt := anIMSI.
	(gt beginsWith: '27408') ifTrue: [
		gt := gt replaceFrom: 1 to: 6 with: '354385'].


	^ (SCCPAddress createForSSN: #hlr)
		routedOnSSN: false;
		gtiFromAddr:  (SCCPGlobalTitleTranslation new
							nature: SCCPGlobalTitle naiInternationalNumber;
							plan: SCCPGlobalTitle npMobile;
							addr: gt;
							translation: 0;
							yourself);
		yourself