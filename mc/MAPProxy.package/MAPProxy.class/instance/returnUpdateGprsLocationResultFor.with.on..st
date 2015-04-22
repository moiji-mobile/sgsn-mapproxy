as yet unclassified
returnUpdateGprsLocationResultFor: aRequest with: anOperation on: aDelegate
	| result |
	"TODO.. aResult should collect all ISD invocations..."
	result := MAPProxyUpdateGprsLocationResult new.
	result mobileIdentity: aRequest mobileIdentity.
	anOperation pdpInfoComplete ifTrue: [
		result pdpInfoComplete: true].
	result pdpInfos: anOperation pdpInfos.
	result msisdn: anOperation msisdn.
	aDelegate sendGSUP: result toMessage asByteArray.