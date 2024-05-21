// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import smmeta "github.com/external-secrets/external-secrets/apis/meta/v1"

// AuthType describes how to authenticate to the Azure Keyvault
// Only one of the following auth types may be specified.
// If none of the following auth type is specified, the default one
// is ServicePrincipal.
// +kubebuilder:validation:Enum=ServicePrincipal;ManagedIdentity;WorkloadIdentity
#AzureAuthType: string // #enumAzureAuthType

#enumAzureAuthType:
	#AzureServicePrincipal |
	#AzureManagedIdentity |
	#AzureWorkloadIdentity

// Using service principal to authenticate, which needs a tenantId, a clientId and a clientSecret.
#AzureServicePrincipal: #AzureAuthType & "ServicePrincipal"

// Using Managed Identity to authenticate. Used with aad-pod-identity installed in the clister.
#AzureManagedIdentity: #AzureAuthType & "ManagedIdentity"

// Using Workload Identity service accounts to authenticate.
#AzureWorkloadIdentity: #AzureAuthType & "WorkloadIdentity"

// Configures an store to sync secrets using Azure KV.
#AzureKVProvider: {
	// Auth type defines how to authenticate to the keyvault service.
	// Valid values are:
	// - "ServicePrincipal" (default): Using a service principal (tenantId, clientId, clientSecret)
	// - "ManagedIdentity": Using Managed Identity assigned to the pod (see aad-pod-identity)
	// +optional
	// +kubebuilder:default=ServicePrincipal
	authType?: null | #AzureAuthType @go(AuthType,*AzureAuthType)

	// Vault Url from which the secrets to be fetched from.
	vaultUrl?: null | string @go(VaultURL,*string)

	// TenantID configures the Azure Tenant to send requests to. Required for ServicePrincipal auth type.
	// +optional
	tenantId?: null | string @go(TenantID,*string)

	// Auth configures how the operator authenticates with Azure. Required for ServicePrincipal auth type.
	// +optional
	authSecretRef?: null | #AzureKVAuth @go(AuthSecretRef,*AzureKVAuth)

	// ServiceAccountRef specified the service account
	// that should be used when authenticating with WorkloadIdentity.
	// +optional
	serviceAccountRef?: null | smmeta.#ServiceAccountSelector @go(ServiceAccountRef,*smmeta.ServiceAccountSelector)

	// If multiple Managed Identity is assigned to the pod, you can select the one to be used
	// +optional
	identityId?: null | string @go(IdentityID,*string)
}

// Configuration used to authenticate with Azure.
#AzureKVAuth: {
	// The Azure clientId of the service principle used for authentication.
	// +optional
	clientId?: null | smmeta.#SecretKeySelector @go(ClientID,*smmeta.SecretKeySelector)

	// The Azure ClientSecret of the service principle used for authentication.
	// +optional
	clientSecret?: null | smmeta.#SecretKeySelector @go(ClientSecret,*smmeta.SecretKeySelector)
}
