as yet unclassified
start
	| operationName invocation parameter |
	operationName := 'updateGprsLocation'.
	parameter :=  ASN1Dictionary new
				at: 'imsi' put: imsi toTBCD;
				at: 'sgsn-Number' put: vlrNumber toE164;
				at: 'sgsn-Address' put: 'AABBCCDD';
				yourself.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure];
		onInvoke: [:isd |
			"TODO extract parameters for success handling"
			isd invocation returnResultLast: nil.
			dialogue requestTcContinue].
	invocation := dialogue requestTcInvokeNamed: operationName parameters:  parameter class: 1 timeout: 60.
	invocation
		onReturn: [self failure];
		onError: [self failure];
		onReject: [self failure];
		onLCancel: [[self failure] ensure: [ dialogue terminate]];
		onReturnLast: [:result | self successWith: [result]].
	dialogue
		requestTcBeginDestinationAddress: calledSCCPAddress
		originatingAddress: callingSCCPAddress
		applicationContextName: (dialogue applicationContextNamed: operationName).