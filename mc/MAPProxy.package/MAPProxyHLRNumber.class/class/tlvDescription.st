as yet unclassified
tlvDescription
	^TLVDescription new
		instVarName: #hlrNumber;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		beOptional;
		tag: 16r09;
		yourself