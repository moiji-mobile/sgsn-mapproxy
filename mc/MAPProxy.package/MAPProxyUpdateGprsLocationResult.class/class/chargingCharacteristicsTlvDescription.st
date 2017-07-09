as yet unclassified
chargingCharacteristicsTlvDescription
	^TLVDescription new
		instVarName: #chargingCharacteristics;
		parseClass: TLVOctetValue;
		useDelegatedWrite;
		beTLV;
		beForceTagged;
		beOptional;
		tag: 16r14;
		yourself