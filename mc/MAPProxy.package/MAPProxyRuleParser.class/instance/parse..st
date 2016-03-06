as yet unclassified
parse: aFileName
	aFileName asFileReference readStreamDo: [:str | self parseFromStream: str ] ifAbsent: [
		logger logError: 'File does not exist' with: { 'filename' -> aFileName }].