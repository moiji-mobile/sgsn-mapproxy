as yet unclassified
tlvDescription
	^TLVDescription new
		instVarName: #mobileIdentity;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		tag: 16r01;
		yourself