as yet unclassified
tlvDescription
	^TLVDescription new
		instVarName: #msisdn;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		beOptional;
		tag: 16r08;
		yourself