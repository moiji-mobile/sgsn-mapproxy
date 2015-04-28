as yet unclassified
returnSendAuthenticationResultFor: aRequest with: aList on: aDelegate
	| result |

	logger logError: 'sendAuthentication result' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD}.

	result := MAPProxySendAuthenticationInfoResult new.
	result mobileIdentity: aRequest mobileIdentity.
	aList do: [:each |
		result addAuthTuple: (MAPProxyAuthTuple new
								rand: each rand; sres: each sres; kc: each kc;
								yourself)].
	aDelegate sendGSUP: result toMessage asByteArray.