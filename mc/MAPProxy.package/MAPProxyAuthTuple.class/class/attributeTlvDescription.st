as yet unclassified
attributeTlvDescription
	^TLVListDescription new
		instVarName: #authTuples;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		tag: 16r03;
		yourself