baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/'.
		spec 
			project: 'Osmocom' with: [
				spec
					className: #ConfigurationOfOsmocom;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'CDR' with: [
				spec
					className: #ConfigurationOfCDR;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'ASN1' with: [
				spec
					className: #ConfigurationOfASN1;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main/' ];
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.63';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ];
			project: 'HLR' with: [
				spec
					className: #ConfigurationOfHLR;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'OsmoCrashReportClient' with: [
				spec
					className: #ConfigurationOfOsmoCrashReportClient;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/OsmoCrashReport/main/' ];
			project: 'OsmoSyslog' with: [
				spec
					className: #ConfigurationOfOsmoSyslog;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/osmocom/OsmoSyslog/main/' ].
		spec 
			package: 'OsmoSocket';
			package: #'SS7-Helper';
			package: 'MAPProxy' with: [
				spec requires: #('OsmoSocket' 'Osmocom' 'TCAP' 'ASN1' #'SS7-Helper' ). ]. ].
