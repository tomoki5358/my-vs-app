// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

// SenhaseguraAuth tells the controller how to do auth in senhasegura
#SenhaseguraAuth: {
	clientId:              string                    @go(ClientID)
	clientSecretSecretRef: esmeta.#SecretKeySelector @go(ClientSecret)
}

// SenhaseguraModuleType enum defines senhasegura target module to fetch secrets
// +kubebuilder:validation:Enum=DSM
#SenhaseguraModuleType: string // #enumSenhaseguraModuleType

#enumSenhaseguraModuleType:
	#SenhaseguraModuleDSM

// SenhaseguraModuleDSM is the senhasegura DevOps Secrets Management module
// see: https://senhasegura.com/devops
#SenhaseguraModuleDSM: #SenhaseguraModuleType & "DSM"

// SenhaseguraProvider setup a store to sync secrets with senhasegura
#SenhaseguraProvider: {
	// URL of senhasegura 
	url: string @go(URL)

	// Module defines which senhasegura module should be used to get secrets 
	module: #SenhaseguraModuleType @go(Module)

	// Auth defines parameters to authenticate in senhasegura 
	auth: #SenhaseguraAuth @go(Auth)

	// IgnoreSslCertificate defines if SSL certificate must be ignored
	// +kubebuilder:default=false
	ignoreSslCertificate?: bool @go(IgnoreSslCertificate)
}
