as yet unclassified
returnUpdateGprsLocationResultFor: aRequest with: anOperation on: aDelegate result: aResult
	| result hlrNumber |

	(aResult find: 'hlr-Number') ifNotNil: [:number |
		hlrNumber := number contents fromE164].

	logger logNotice: 'updateGprs result' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD. 'hlrNumber' -> hlrNumber}.

	"TODO.. aResult should collect all ISD invocations..."
	result := MAPProxyUpdateGprsLocationResult new.
	result mobileIdentity: aRequest mobileIdentity.
	result hlrNumber: ((aResult find: 'hlr-Number') ifNotNil: [ :number | number contents ]).
	anOperation pdpInfoComplete ifTrue: [
		result pdpInfoComplete: true].
	result pdpInfos: anOperation pdpInfos.
	result msisdn: anOperation msisdn.
	aDelegate sendGSUP: result toMessage asByteArray.