// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/external-secrets/external-secrets/apis/externalsecrets/v1beta1

package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	esmeta "github.com/external-secrets/external-secrets/apis/meta/v1"
)

// AkeylessProvider Configures an store to sync secrets using Akeyless KV.
#WebhookProvider: {
	// Webhook Method
	// +optional, default GET
	method?: string @go(Method)

	// Webhook url to call
	url: string @go(URL)

	// Headers
	// +optional
	headers?: {[string]: string} @go(Headers,map[string]string)

	// Body
	// +optional
	body?: string @go(Body)

	// Timeout
	// +optional
	timeout?: null | metav1.#Duration @go(Timeout,*metav1.Duration)

	// Result formatting
	result: #WebhookResult @go(Result)

	// Secrets to fill in templates
	// These secrets will be passed to the templating function as key value pairs under the given name
	// +optional
	secrets?: [...#WebhookSecret] @go(Secrets,[]WebhookSecret)

	// PEM encoded CA bundle used to validate webhook server certificate. Only used
	// if the Server URL is using HTTPS protocol. This parameter is ignored for
	// plain HTTP protocol connection. If not set the system root certificates
	// are used to validate the TLS connection.
	// +optional
	caBundle?: bytes @go(CABundle,[]byte)

	// The provider for the CA bundle to use to validate webhook server certificate.
	// +optional
	caProvider?: null | #WebhookCAProvider @go(CAProvider,*WebhookCAProvider)
}

#WebhookCAProviderType: string // #enumWebhookCAProviderType

#enumWebhookCAProviderType:
	#WebhookCAProviderTypeSecret |
	#WebhookCAProviderTypeConfigMap

#WebhookCAProviderTypeSecret:    #WebhookCAProviderType & "Secret"
#WebhookCAProviderTypeConfigMap: #WebhookCAProviderType & "ConfigMap"

// Defines a location to fetch the cert for the webhook provider from.
#WebhookCAProvider: {
	// The type of provider to use such as "Secret", or "ConfigMap".
	// +kubebuilder:validation:Enum="Secret";"ConfigMap"
	type: #WebhookCAProviderType @go(Type)

	// The name of the object located at the provider type.
	name: string @go(Name)

	// The key the value inside of the provider type to use, only used with "Secret" type
	// +kubebuilder:validation:Optional
	key?: string @go(Key)

	// The namespace the Provider type is in.
	// +optional
	namespace?: null | string @go(Namespace,*string)
}

#WebhookResult: {
	// Json path of return value
	// +optional
	jsonPath?: string @go(JSONPath)
}

#WebhookSecret: {
	// Name of this secret in templates
	name: string @go(Name)

	// Secret ref to fill in credentials
	secretRef: esmeta.#SecretKeySelector @go(SecretRef)
}