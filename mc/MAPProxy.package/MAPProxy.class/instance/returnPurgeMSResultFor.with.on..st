as yet unclassified
returnPurgeMSResultFor: aRequest with: aResult on: aDelegate
	| result |

	logger logError: 'purgeMS result' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD}.

	result := MAPProxyPurgeMSResult  new.
	result mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: result toMessage asByteArray.