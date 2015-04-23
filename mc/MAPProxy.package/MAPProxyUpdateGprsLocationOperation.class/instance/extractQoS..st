as yet unclassified
extractQoS: aPDPInfo 
	| qos data tmp |

	"Is there data?"
	qos := aPDPInfo qos_Subscribed.
	qos ifNil: [ ^nil ].

	"Now the crazy stuff starts as the octets are not simply appended
	but one of them needs to be prepended"
	tmp := aPDPInfo ext_QoS_Subscribed.
	tmp ifNil: [ ^qos].
	data := #[] writeStream.
	data
		nextPut: tmp first;
		nextPutAll: qos;
		nextPutAll: tmp allButFirst.

	
	aPDPInfo ext2_QoS_Subscribed ifNotNil: [:ext | data nextPutAll: ext].
	aPDPInfo ext3_QoS_Subscribed ifNotNil: [:ext | data nextPutAll: ext].
	^data contents