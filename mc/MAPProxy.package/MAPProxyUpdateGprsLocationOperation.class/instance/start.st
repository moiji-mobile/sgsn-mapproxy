as yet unclassified
start
	| operationName invocation parameter operation |
	operationName := 'updateGprsLocation'.
	operation := dialogue rosOperationNamed: operationName.
	parameter := operation newArgumentValue
		at: 'imsi' put: imsi toTBCD;
		at: 'sgsn-Number' put: sgsnNumber toE164;
		at: 'sgsn-Address' put: sgsnAddress;
		yourself.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure];
		onInvoke: [:isd |
			self extractMSISDN: isd argument.
			self extractPDPInfo: isd argument.
			isd invocation returnResultLast: nil.
			dialogue requestTcContinue].
	invocation := dialogue requestTcInvoke: operation parameters:  parameter class: 1 timeout: 60.
	invocation
		onReturn: [self failure];
		onError: [self failure];
		onReject: [self failure];
		onLCancel: [[self failure] ensure: [ dialogue terminate]];
		onReturnLast: [:result | self successWith: [result]].
	dialogue
		requestTcBeginDestinationAddress: calledSCCPAddress
		originatingAddress: callingSCCPAddress
		applicationContextName: (dialogue applicationContextOidForOperationNamed: operationName).