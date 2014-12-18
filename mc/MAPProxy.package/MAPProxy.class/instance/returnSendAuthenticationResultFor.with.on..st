as yet unclassified
returnSendAuthenticationResultFor: aRequest with: aMapResult on: aDelegate
	| result |
	result := MAPProxySendAuthenticationInfoResult new.
	result mobileIdentity: aRequest mobileIdentity.
	aMapResult resultObject elements do: [:each |
		result addAuthTuple: (MAPProxyAuthTuple new
								rand: each rand; sres: each sres; kc: each kc;
								yourself)].
	aDelegate sendGSUP: result toMessage asByteArray.