as yet unclassified
testSendAuthenticationInfoV3
	| invoked resp respMsg |

	(mapProxy gtForIMSI: '123')
		operationForAuthentication: MAPProxyAuthenticationV3Operation.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invoked := true.
				invocation returnResultLastUsing: [ :result | 
					result beSelfExpanding authenticationSetList tripletList
						addUsing: [ :item |  
							item
								at: 'rand' put: #[0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5];
								at: 'sres' put: #[0 1 2 3];
								at: 'kc' put: #[0 1 2 3 4 5 6 7] ];
						addUsing: [ :item | 
							item
								at: 'rand' put: #[0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 6];
								at: 'sres' put: #[0 1 2 4];
								at: 'kc' put: #[0 1 2 3 4 5 6 8] ]].
				diag requestTcEnd: false]].

	self inject: MAPProxySendAuthenticationInfoTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxySendAuthenticationInfoResult.
	self assert: respMsg authTuples size equals: 2.
	self assert: respMsg authTuples first rand equals: #[0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5].
	self assert: respMsg authTuples first sres equals: #[0 1 2 3].
	self assert: respMsg authTuples first kc equals: #[0 1 2 3 4 5 6 7].

	self assert: respMsg authTuples second rand equals: #[0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 6].
	self assert: respMsg authTuples second sres equals: #[0 1 2 4].
	self assert: respMsg authTuples second kc equals: #[0 1 2 3 4 5 6 8].