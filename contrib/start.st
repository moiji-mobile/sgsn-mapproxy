| server mapProxy conn tcap |

"Create a connection class"
conn := SCCPNetworkServiceOsmoDirect new
    hostname: 'localhost' port: 5002;
    token: 'some-token';
    yourself.

"Create a TCAP endpoint."
tcap := TCAPServiceEndPoint new.
tcap networkService: conn.
tcap asn1Model: MAPProxy asn1Model.

"Create Server accepting Osmo/IPA multiplexed messages"
server := OsmoMessageServer new.
MAPProxy asn1Model: tcap asn1Model.
mapProxy := MAPProxy new.
mapProxy endPoint: tcap.
mapProxy vlrNumber: '12345'.
mapProxy sgsnAddress: #[4 0 0 0 0].
mapProxy gsupServer: server.

"Osmo/IPA messages should be delegated to the MAPProxy"
server serverDelegate: (MAPProxyServerDelegate new mapProxy: mapProxy; yourself).

"Configure IMSI -> E212/E214 mapping and which operation to use"
mapProxy addGT:
	(MAPProxyGT new
		imsiRange: '26201.*' asRegex;
		replaceStart: '491234';
		operationForAuthentication: MAPProxyAuthenticationV2Operation;
		yourself).

"Start all of it"
conn start.
server start: 23501.
