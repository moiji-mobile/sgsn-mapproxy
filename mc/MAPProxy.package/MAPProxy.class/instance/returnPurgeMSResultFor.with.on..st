as yet unclassified
returnPurgeMSResultFor: aRequest with: aResult on: aDelegate
	| result |
	
	result := MAPProxyPurgeMSResult  new.
	result mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: result toMessage asByteArray.