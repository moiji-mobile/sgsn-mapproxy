as yet unclassified
attributeTlvDescription
	^TLVListDescription new
		instVarName: #pdpInfos;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		tag: 16r05;
		yourself