as yet unclassified
setUp
	mapProxy := MAPProxy new.
	readDelegate := MAPProxyReadDelegate new.
	readDelegate onNewConnection: OsmoMessageSocket new.
	readDelegate connection readDelegate: readDelegate.

	socketServer := OsmoMessageServer new.
	socketServer addClientConnection: readDelegate connection.
	mapProxy gsupServer: socketServer.

	testEndPoint := TCAPTestServiceEndPoint new
		asn1Model: MAPProxy asn1Model.
	vlrEndPoint := TCAPTestServiceEndPoint new
		factory: TCAPObjectFactory new;
		asn1Model: MAPProxy asn1Model.

	mapProxy endPoint: vlrEndPoint.
	mapProxy vlrNumber: '123'.
	mapProxy sgsnAddress: #[4 127 0 0 1].
	readDelegate mapProxy: mapProxy.

	mapProxy addGT: (MAPProxyGT new
						imsiRange: '.*' asRegex;
						replaceStart: '123';
						operationForAuthentication: MAPProxyAuthenticationV2Operation;
						yourself).

	testEndPoint connectTo: vlrEndPoint.
	vlrEndPoint connectTo: testEndPoint.