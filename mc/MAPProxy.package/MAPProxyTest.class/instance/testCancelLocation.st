as yet unclassified
testCancelLocation
	| cancelLocation diag invoke invokeResult gsupReq |
	cancelLocation := 'Identity' asAsn1ValueTypedIn: testEndPoint asn1Model.
	cancelLocation imsi: '262031234' toTBCD.

	diag := testEndPoint newDialogue.
	invoke := diag requestTcInvokeNamed: 'cancelLocationV2' parameters: cancelLocation class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false];
		onError: [self assert: false];
		onReturnLast: [:res | invokeResult := res].
	diag
		requestTcBeginDestinationAddress: (mapProxy callingSCCPAddress)
		originatingAddress: (mapProxy calledSCCPAddress: '456')
		applicationContextName: (diag applicationContextNamed: 'cancelLocationV2').

	"TODO: We should demux it here properly!"
	self deny: invokeResult isNil.
	gsupReq := readDelegate connection writeQueue next.
	gsupReq := MAPProxyMessageBase readFrom: (gsupReq readStream skip: 4; yourself).
	self assert: gsupReq class equals: MAPProxyCancellationRequest.