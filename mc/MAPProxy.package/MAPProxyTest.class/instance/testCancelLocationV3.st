as yet unclassified
testCancelLocationV3
	| cancelLocation diag invoke invokeResult gsupReq |
	cancelLocation := 'CancelLocationArg' asAsn1ValueTypedIn: testEndPoint asn1Model.
	cancelLocation beSelfExpanding.
	cancelLocation identity imsi: '262031234' toTBCD.

	diag := testEndPoint newDialogue.
	invoke := diag requestTcInvokeNamed: 'cancelLocationV3' parameters: cancelLocation class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false];
		onError: [self assert: false];
		onReturnLast: [:res | invokeResult := res].
	diag
		requestTcBeginDestinationAddress: (mapProxy callingSCCPAddress: SCCPAddress ssnHLR)
		originatingAddress: (mapProxy calledSCCPAddress: '456')
		applicationContextName: (diag applicationContextOidForOperationNamed: 'cancelLocationV3').

	"TODO: We should demux it here properly!"
	self deny: invokeResult isNil.
	gsupReq := readDelegate connection writeQueue next.
	gsupReq := MAPProxyMessageBase readFrom: (gsupReq readStream skip: 4; yourself).
	self assert: gsupReq class equals: MAPProxyCancellationRequest.