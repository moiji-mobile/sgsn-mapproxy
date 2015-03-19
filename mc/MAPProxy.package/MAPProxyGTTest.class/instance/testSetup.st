as yet unclassified
testSetup
	| match |
	match :=MAPProxyGT new.

	self assert: match callingSSN equals: SCCPAddress ssnHLR.

	match callingSSN: 1024.
	self assert: match callingSSN equals: 1024