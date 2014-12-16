as yet unclassified
tlvDescription
	^TLVDescription new
		instVarName: #pdpInfoComplete;
		parseClass: self;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		tag: 16r04;
		minSize: 0 maxSize: 0;
		yourself