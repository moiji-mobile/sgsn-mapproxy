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
					versionString: #'bleddingEdge';
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
					versionString: #'bleddingEdge';
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
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ].
		spec 
			package: 'OsmoSocket';
			package: 'MAPProxy' with: [
				spec requires: #('OsmoSocket' 'Osmocom' 'TCAP' 'ASN1' ). ]. ].
