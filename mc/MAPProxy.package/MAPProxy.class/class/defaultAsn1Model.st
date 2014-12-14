as yet unclassified
defaultAsn1Model
	^ ASN1 new 
		addLibrary: ROSModuleLibrary new;
		addLibrary: MAPModuleLibrary new;
		addLibrary: TCAPModuleLibrary new;
		model