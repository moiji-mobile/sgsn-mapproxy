as yet unclassified
handleGSUP: aCollection 
	| msg |
	msg := MAPProxyMessageBase readFrom: aCollection readStream.
	msg dispatchMAPProxyOn: self.