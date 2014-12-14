as yet unclassified
testWrongMessage
	| msg |
	msg := MAPProxyMessageBase readFrom: MAPProxySendAuthenticationInfoErrorTest new exampleData readStream.
	msg dispatchMAPProxyOn: readDelegate.
	self assert: readDelegate connection isTerminated