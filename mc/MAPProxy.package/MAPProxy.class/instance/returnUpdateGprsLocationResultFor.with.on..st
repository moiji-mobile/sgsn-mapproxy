as yet unclassified
returnUpdateGprsLocationResultFor: aRequest with: aResult on: aDelegate
	| result |
	"TODO.. aResult should collect all ISD invocations..."
	result := MAPProxyUpdateGprsLocationResult new.
	result mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: result toMessage asByteArray.