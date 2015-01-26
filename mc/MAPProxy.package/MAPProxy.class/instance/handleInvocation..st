as yet unclassified
handleInvocation: invocationReceived
	| conns |
	invocationReceived invocation returnResultLast: nil.
	invocationReceived dialogue requestTcEnd: false.

	self flag: #todo. "Spawn a real transaction on our own.."
	conns := gsupServer allConnections.
	conns isEmpty ifTrue: [^self].
	
	(invocationReceived operationName = 'cancelLocationV2') ifTrue: [
		| cancel |
		cancel := MAPProxyCancellationRequest new.
		cancel mobileIdentity: invocationReceived  argument imsi.
		cancel cause: #[0].
		conns first readDelegate sendGSUP: cancel toMessage asByteArray
	].
	(invocationReceived operationName = 'cancelLocationV3') ifTrue: [
		| cancel type |
		cancel := MAPProxyCancellationRequest new.
		cancel mobileIdentity: invocationReceived  argument identity imsi.
		type := {invocationReceived argument cancellationType ifNil: [0]}.
		cancel cause: type.
		conns first readDelegate sendGSUP: cancel toMessage asByteArray
	].
